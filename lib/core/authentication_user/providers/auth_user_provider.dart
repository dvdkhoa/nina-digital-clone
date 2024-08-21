import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../../firebase_api.dart';
import '../../../shared/app_config.dart';
import '../../../shared/utils/helper.dart';
import '../model/user_model.dart';
import '../repositories/auth_user_repository.dart';

part 'auth_user_provider.g.dart';
part 'auth_user_state.dart';

@Riverpod(keepAlive: true)
class AuthUser extends _$AuthUser {
  late final AuthUserRepository _authUserRepository;

  @override
  AuthUserState build() {
    _authUserRepository = ref.watch(authUserRepositoryProvider);
    return AuthUserState();
  }

  Future<void> init() async {
    await _authUserRepository.initData();
    await checkSignIn();
  }

  Future<void> checkSignIn() async {
    if (await isTokenValid()) {
      await _signInContinue();
    } else {
      signOut();
    }
  }

  Future<bool> isTokenValid() async {
    final String? accessToken = _authUserRepository.accessToken;
    if (accessToken != null && accessToken != '') {
      return await _authUserRepository.isTokenValid(accessToken);
    }
    return false;
  }

  Future<void> _signInContinue() async {
    final dataUser = jsonDecode(_authUserRepository.dataUser.toString());
    int idUser = int.parse(dataUser['id'].toString());
    final userLogin = await getInfoUser(idUser);
    if (userLogin != null) {
      await _authUserRepository.saveDataUser(
          dataUser: jsonEncode(userLogin.toJson()));
      state = state.copyWith(
        status: AuthStatus.authenticated,
        userLogin: userLogin,
      );
    } else {
      signOut();
    }
  }

  Future<void> updateUserLogin({required Map<String, dynamic> data}) async {
    if (data.isNotEmpty) {
      final newUser = UserModel.fromJson(data);
      state = state.copyWith(userLogin: newUser);
      await _authUserRepository.saveDataUser(dataUser: jsonEncode(data));
    }
  }

  String getAccessToken() {
    return _authUserRepository.accessToken ?? '';
  }

  Future<String> refreshAccessToken() async {
    final String? refreshToken = _authUserRepository.refreshToken;

    if (Helper.isNull(refreshToken) == false) {
      return await _authUserRepository.refreshAccessToken(refreshToken);
    }
    return '';
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    final response = await _authUserRepository.signIn(data: data);
    if (response['status'] == 'success') {
      state = AuthUserState(
        status: AuthStatus.authenticated,
        userLogin: UserModel.fromJson(response['data']),
      );
      // if (AppConfig.debugDeviceIOS == false) {
      //   await FirebaseApi.subscribeToTopic();
      // }
    } else {
      state = AuthUserState(
        status: AuthStatus.unauthenticated,
        userLogin: null,
      );
    }
    return response;
  }

  Future<UserModel?> getInfoUser(int id) async {
    final result = await _authUserRepository.getInfoUser(id: id);
    if (result['status'] == 'success') {
      return UserModel.fromJson(result['data']);
    }
    return null;
  }

  Future<void> saveDeviceToken(String token) async {
    await _authUserRepository.updateDatabaseUser(data: {'deviceToken': token});
  }

  Future<void> signOut() async {
    _authUserRepository.clearData();
    // if (AppConfig.debugDeviceIOS == false) {
    //   await FirebaseApi.unsubscribeFromTopic();
    // }
    state = AuthUserState(status: AuthStatus.unauthenticated, userLogin: null);
  }

  updateCrush(productId) {
    final userInfo = state.userLogin;
    final crush = userInfo?.crush ?? '';

    List<String> arr = crush.split(',');

    final isExists = arr.contains(productId.toString());
    if (isExists) {
      arr.remove(productId.toString());
    } else {
      arr.add(productId.toString());
    }

    final str = arr.join(",");

    final newUserInfo = userInfo?.copyWith(crush: str);

    print(str);

    state = state.copyWith(userLogin: newUserInfo);
  }
}
