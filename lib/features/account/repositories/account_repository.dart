import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class AccountRepository {
  DioClient dioClient;

  AccountRepository(this.dioClient);

  Future changeAvatar(int userId, File file) async {
    final FormData formData = FormData();
    formData.files
        .add(MapEntry('avatar', await MultipartFile.fromFile(file.path)));

    final res = await dioClient
        .post('${ApiUrl.CHANGE_AVATAR}?id_user=${userId}', data: formData);
    if (res.statusCode == 200) {
      return res.data;
    }
  }

  Future updateInfomation(int userId, data) async {

    final birthday = data['birthday'] as int;

    data['birthday'] = (birthday / 1000).toInt();

    final res = await dioClient
        .put('${ApiUrl.ACCOUNT}/$userId', data: data);
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(ref.watch(dioProvider));
});

