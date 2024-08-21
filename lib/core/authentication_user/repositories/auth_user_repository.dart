import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';
import '../../../shared/extensions/response_ext.dart';
import '../../../shared/utils/helper.dart';
import '../auth_user_storage/auth_user_storage.dart';
import '../model/user_model.dart';

final authUserRepositoryProvider = Provider<AuthUserRepository>((ref) {
  return AuthUserRepository(ref.watch(dioProvider));
});

class AuthUserRepository {
  final AuthUserStorage _authUserStorage = AuthUserStorage();
  final DioClient _dioClient;

  AuthUserRepository(this._dioClient);

  String? get accessToken => _authUserStorage.accessToken;
  String? get refreshToken => _authUserStorage.refreshToken;
  String? get dataUser => _authUserStorage.dataUser;

  Future<void> initData() async {
    _authUserStorage.init();
  }

  Future<void> clearData() async {
    await _authUserStorage.clearData();
  }

  Future<void> _saveData(
      {String? accessToken, String? refreshToken, String? dataUser}) async {
    await _authUserStorage.saveData(
        accessToken: accessToken,
        refreshToken: refreshToken,
        dataUser: dataUser);

    // reInit (refresh)
    await initData();
  }

  Future<void> saveDataUser({required String dataUser}) async {
    await _authUserStorage.saveData(dataUser: dataUser);
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    Map<String, dynamic> result = {};

    String accessToken = '';
    String refreshToken = '';
    String dataUser = '';

    final response = await _dioClient.post(ApiUrl.signIn, data: data);
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') {
        final data = response.data['data'];
        final userModel = UserModel.fromJson(data['data']);
        accessToken = data['accessToken'];
        refreshToken = data['refreshToken'];
        dataUser = jsonEncode(userModel.toJson());

        result = {
          'status': response.data['status'],
          'data': userModel.toJson(),
          'message': response.data['message'],
        };
      } else {
        result = {
          'status': response.data['status'],
          'data': {},
          'message': response.data['message'],
        };
      }
    } else {
      result = response.toMapError();
    }
    await _saveData(
        accessToken: accessToken,
        refreshToken: refreshToken,
        dataUser: dataUser);
    return result;
  }

  Future<bool> isTokenValid(String? token) async {
    if (Helper.isNull(token)) return false;
    final response =
        await _dioClient.post(ApiUrl.checkToken, data: {'token': token});
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') return true;
    }
    return false;
  }

  Future<String> refreshAccessToken(String? refreshToken) async {
    if (Helper.isNull(refreshToken)) return '';
    final response = await _dioClient
        .post(ApiUrl.refreshToken, data: {'token': refreshToken});
    String newAccessToken = '';

    if (response.statusCode == 200) {
      final data = response.data['data'];
      final newAccessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];
      await _saveData(
          accessToken: newAccessToken, refreshToken: newRefreshToken);
      return newAccessToken;
    }
    return newAccessToken;
  }

  Future<Map> updateDatabaseUser({required Map data}) async {
    Map result = {};
    if (!Helper.isNull(dataUser)) {
      final user = jsonDecode(dataUser!);
      final Response response = await _dioClient
          .put('${ApiUrl.accountUpdate}/${user['id']}', data: data);
      if (response.statusCode == 200) {
        result = response.data;
      } else {
        result = {
          'status': 'error',
          'message': response.statusMessage,
        };
      }
    }
    return result;
  }

  Future<Map> getInfoUser({required int id}) async {
    Map result = {};
    final Response response =
        await _dioClient.get('${ApiUrl.accountUpdate}/$id');
    if (response.statusCode == 200) {
      result = response.data;
    } else {
      result = {
        'status': 'error',
        'message': response.data['message'],
      };
    }
    return result;
  }
}
