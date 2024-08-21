import 'package:dio/dio.dart';

extension ErrorResponse on Response {
  toMapSuccess() {
    Map<String, dynamic> result = {};
    if (statusCode == 200) {
      result = data;
    }
    return result;
  }

  toMapError() {
    Map<String, dynamic> result = {};
    if (statusCode != 200) {
      result = {
        'status': 'error',
        'statusCode': statusCode,
        'message': statusMessage,
        'data': data,
      };
    }
    return result;
  }
}
