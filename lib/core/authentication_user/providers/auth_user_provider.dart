import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  Future<void> checkSignIn() async {
    if (await isTokenValid()) {
      await _signInContinue();
    } else if (await refreshAccessToken()) {
      await _signInContinue();
    } else {
      // Đăng xuất
      signOut();
    }
  }

  Future<void> _signInContinue() async {
    state = state.copyWith(
      status: AuthStatus.authenticated,
      userLogin: (_authUserRepository.userLogin != '' &&
              _authUserRepository.userLogin != null)
          ? UserModel.fromJson(
              jsonDecode(_authUserRepository.userLogin.toString()))
          : const UserModel(),
    );
  }

  UserModel? getUserLogin() {
    if (!Helper.isNull(_authUserRepository.userLogin)) {
      return state.userLogin;
    }
    return null;
  }

  String getAccessToken() {
    return _authUserRepository.accessToken ?? '';
  }

  Future<bool> isTokenValid() async {
    final String? accessToken = _authUserRepository.accessToken;
    if (accessToken != null && accessToken != '') {
      return await _authUserRepository.isTokenValid(accessToken);
    }
    return false;
  }

  Future<dynamic> refreshAccessToken({bool typeString = false}) async {
    final String? refreshToken = _authUserRepository.refreshToken;

    if (refreshToken != null && refreshToken != '') {
      final result = await _authUserRepository.refreshAccessToken(refreshToken,
          typeString: typeString);
      return result;
    }
    return false;
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    final response = await _authUserRepository.signIn(data: data);
    if (response['status'] == 'success') {
      state = AuthUserState(
        status: AuthStatus.authenticated,
        userLogin: UserModel.fromJson(response['data']),
      );
    } else {
      state = AuthUserState(
        status: AuthStatus.unauthenticated,
        userLogin: null,
      );
    }
    return response;
  }

  void signOut() {
    _authUserRepository.clearToken();
    state = AuthUserState(status: AuthStatus.unauthenticated, userLogin: null);
  }
}
