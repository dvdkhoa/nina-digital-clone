import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/utils/helper.dart';
import '../authentication_user/providers/auth_user_provider.dart';
import 'jwt_handler.dart';

part 'auth_interceptor.dart';
part 'dio_exceptions.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient(ref);
});

class DioClient {
  final Dio _dio = Dio(); // dio instance
  final Ref _ref;

  // injecting dio instance
  DioClient(this._ref) {
    _dio
      ..options.baseUrl = ApiUrl.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json
      ..interceptors.add(AuthUserInterceptor(_ref));
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _responseError(e);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _responseError(e);
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _responseError(e);
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      return _responseError(e);
    }
  }

  Future<Response> downloadFile(
      {required String url,
      required String savePath,
      Function(int received, int total)? onReceiveProgress}) async {
    try {
      final Response response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _responseError(e);
    }
  }

  Response _responseError(DioException err) {
    final errorMessage = DioExceptions.fromDioError(err).toString();
    return Response(
      statusCode: err.response?.statusCode,
      statusMessage: errorMessage,
      data: (err.response != null) ? err.response?.data : null,
      requestOptions: err.requestOptions,
    );
  }
}
