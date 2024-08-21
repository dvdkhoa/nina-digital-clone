part of 'dio_client.dart';

class AuthUserInterceptor extends Interceptor {
  final Ref _ref;

  AuthUserInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String accessToken = _ref.read(authUserProvider.notifier).getAccessToken();
    return handler.next(options.copyWith(
        headers:
            _customHeaders(requestOptions: options, accessToken: accessToken)));
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String accessToken = '';
      int code = err.response?.data['code'];

      if (code != 4012) {
        // xử lý khi refresh token thành công và tiếp tục request
        final requestOptions = err.requestOptions;

        dynamic retryData;

        // Nếu là kiểu FormData
        if (requestOptions.data is FormData) {
          final oldFormData = requestOptions.data as FormData;
          final newFormData = FormData();
          newFormData.fields.addAll(oldFormData.fields);
          for (var fileEntry in oldFormData.files) {
            newFormData.files.add(MapEntry(
              fileEntry.key,
              fileEntry.value.clone(),
            ));
          }
          retryData = newFormData;
        } else {
          retryData = requestOptions.data;
        }

        accessToken =
            await _ref.read(authUserProvider.notifier).refreshAccessToken();

        // Retry request với headers mới
        Map<String, dynamic> newHeaders = Map.from(requestOptions.headers);

        if (Helper.isNull(accessToken) == false) {
          newHeaders['Authorization'] = 'Bearer ${accessToken.toString()}';
          if (requestOptions.path.contains('token/check')) {
            retryData = FormData.fromMap({'token': accessToken});
          }
        }

        try {
          final cloneRep = await Dio().request(
            requestOptions.path,
            data: retryData,
            options: Options(
              headers: newHeaders,
              method: requestOptions.method,
            ),
            queryParameters: requestOptions.queryParameters,
            cancelToken: requestOptions.cancelToken,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
          );

          return handler.resolve(cloneRep);
        } on DioException catch (e) {
          return handler.next(err);
        } catch (e) {
          return handler.reject(err);
        }
      } else {
        // xử lý khi refresh token hết hạn
        _ref.read(authUserProvider.notifier).signOut();
        if (AppConfig.requiredLogin) {
          return handler.reject(err);
        }
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Map<String, dynamic>? _customHeaders(
      {required RequestOptions requestOptions, String accessToken = ''}) {
    int timeNow = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;

    // Authentication API
    String apiToken =
        _getAPIToken(timeAction: timeNow, dataPayload: requestOptions.data);

    // Headers
    Map<String, dynamic> headers = {
      'timeAction': timeNow,
      'API-Token': apiToken,
    };

    if (accessToken != '' && accessToken.isNotEmpty && accessToken != 'null') {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // DEBUG
    if (AppConfig.production == false) {
      final Map<String, dynamic> debugHeaders = Map.from(headers);
      debugHeaders[requestOptions.method] = requestOptions.path;
      if (requestOptions.data != null) {
        if (requestOptions.data is FormData) {
          final FormData formDataRes = (requestOptions.data as FormData);
          debugHeaders['FormData'] = {
            'fields': formDataRes.fields,
            'files': formDataRes.files
          };
        } else {
          debugHeaders['data'] = requestOptions.data;
        }
      }
      debugHeaders.remove('timeAction');
      AppConfig.logger.d(debugHeaders);
    }

    return headers;
  }

  String _getAPIToken({required int timeAction, required dynamic dataPayload}) {
    Map<String, dynamic> payload = {};

    if (dataPayload != null && dataPayload != '') {
      Map<String, dynamic> tempData = {};

      if ((dataPayload is FormData) == false) {
        final tempMap = dataPayload as Map;
        for (final entry in tempMap.entries) {
          // tempData[entry.key] = (Helper.isNull(entry.value)) ? '' : entry.value;
          tempData[entry.key] = entry.value.toString();
        }
      } else {
        final FormData tempFormData = dataPayload;
        for (final entry in tempFormData.fields) {
          // tempData[entry.key] = (Helper.isNull(entry.value)) ? '' : entry.value;
          tempData[entry.key] = entry.value.toString();
        }
      }

      payload = tempData;
    }
    payload['timeAction'] = timeAction;

    final JwtHandler jwtHandler = JwtHandler(secretKey: AppConfig.secretKey);
    return jwtHandler.encode(payload);
  }
}
