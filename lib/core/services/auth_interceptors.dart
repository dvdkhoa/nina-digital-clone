part of 'dio_client.dart';

class AuthUserInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final Ref _ref;
  String _requestPath = '';

  // Lưu trữ header cũ
  RequestOptions? previousOptions;

  AuthUserInterceptor(this._dio, this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String accessToken = _ref.read(authUserProvider.notifier).getAccessToken();

    final cusHeaders = _customHeaders(
        url: options.path, data: options.data, accessToken: accessToken);

    if(options.data is FormData){
      print((options.data as FormData).files);
    }


    options.headers = cusHeaders;

    previousOptions = options;

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String accessToken = '';
      int code = err.response?.data['code'];

      if (code != 4012) {
        _requestPath = err.requestOptions.path;
        // Refresh token
        accessToken = await _ref
            .read(authUserProvider.notifier)
            .refreshAccessToken(typeString: true);
      } else {
        _ref.read(authUserProvider.notifier).signOut();
        return handler.resolve(err.response!);
      }
      // Retry request với token mới
      Options newOptions = Options(
        headers: previousOptions?.headers,
      );

      if (accessToken.isNotEmpty && accessToken != '') {
        newOptions.headers?['Authorization'] =
        'Bearer ${accessToken.toString()}';
      }

      try {
        final response = await _dio.request(_requestPath, options: newOptions);
        return handler.resolve(response); // Trả về response thành công
      } catch (e) {
        return handler.reject(err); // Trả về lỗi nếu request thất bại
      }
    } else {
      return handler.next(err);
    }
  }

  String _getAPIToken({required timeAction, required dynamic dataPayload}) {
    Map<String, dynamic> payload = {};

    if (dataPayload != null && dataPayload != '') {
      Map<String, dynamic> tempData = {};

      if ((dataPayload is FormData) == false) {
        final tempMap = dataPayload as Map;
        for (final entry in tempMap.entries) {
          tempData[entry.key] = entry.value.toString();
        }
      } else {
        final FormData tempFormData = dataPayload;
        for (final entry in tempFormData.fields) {
          tempData[entry.key] = entry.value.toString();
        }
      }

      payload = tempData;
    }
    payload['timeAction'] = timeAction.toString();

    final JwtEncoder jwtEncoder = JwtEncoder(secretKey: AppConfig.secretKey);
    return jwtEncoder.encode(payload);
  }

  Map<String, dynamic>? _customHeaders(
      {required String url, required dynamic data, String accessToken = ''}) {
    int timeNow = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;

    // Authentication API
    String apiToken = _getAPIToken(timeAction: timeNow, dataPayload: data);

    // Headers
    Map<String, dynamic> headers = {
      // 'Content-Type':
      // (data is FormData) ? 'multipart/form-data' : 'application/json',
      'timeAction': timeNow,
      'API-Token': apiToken,
    };

    if (accessToken != '' && accessToken.isNotEmpty && accessToken != 'null') {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // DEBUG
    if (AppConfig.production == false) {
      Map<String, dynamic> debugHeaders = headers;
      debugHeaders['url'] = url;
      debugHeaders.remove('timeAction');
      AppConfig.logger.d(debugHeaders);
    }

    return headers;
  }
}