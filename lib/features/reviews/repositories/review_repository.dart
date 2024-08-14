import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../../product/models/ReviewModel.dart';

class ReviewRepository {
  final DioClient dioClient;

  ReviewRepository(this.dioClient);

  Future createReview(ReviewModel model, List<File> files) async {

    FormData formData = FormData.fromMap(model.toJson());
    for (var file in files) {
      formData.files.add(
        MapEntry('files[]', await MultipartFile.fromFile(file.path)),
      );
    }

    final response = await dioClient.post('${ApiUrl.CREATE_REVIEW}', data: formData);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
