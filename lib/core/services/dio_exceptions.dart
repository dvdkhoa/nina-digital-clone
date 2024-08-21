part of 'dio_client.dart';

class DioExceptions implements Exception {
  late String message;

  final _messageErrorDefault = 'Oops something went wrong';

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      switch (dioError.type) {
        case DioExceptionType.cancel:
          message = 'Request to API server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          message = 'Connection timeout with API server';
          break;
        case DioExceptionType.receiveTimeout:
          message = 'Receive timeout in connection with API server';
          break;
        case DioExceptionType.sendTimeout:
          message = 'Send timeout in connection with API server';
          break;
        case DioExceptionType.unknown:
          message = 'Unexpected error occurred';
          break;
        default:
          if (Helper.isNull(dioError.response) == false) {
            message = _handleError(dioError.response?.statusCode,
                dioError.response?.statusMessage);
          } else {
            message = _messageErrorDefault;
          }
          break;
      }
    } else {
      message =
          'Something happened in setting up or sending the request that triggered an Error';
    }
  }

  String _handleError(int? statusCode, dynamic message) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return message;
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return _messageErrorDefault;
    }
  }

  @override
  String toString() => message;
}
