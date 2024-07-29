import '../../../local_storage/local_storage.dart';
import '../../../local_storage/schema/user_token.dart';

class AuthUserStorage {
  final _localStorage = LocalStorage.isarDB;

  Future<String> getAccessToken() async {
    final UserToken? a = await _getToken();
    return a?.accessToken ?? '';
  }

  Future<String> getRefreshToken() async {
    final UserToken? a = await _getToken();
    return a?.refreshToken ?? '';
  }

  Future<UserToken?> _getToken() async {
    // lây record -> ID: 1
    return await _localStorage.userTokens.get(1);
  }

  Future<void> saveToken({required UserToken userToken}) async {
    UserToken item = _localStorage.userTokens.getSync(1) ?? UserToken();
    final newData = item
      ..accessToken = userToken.accessToken.toString()
      ..refreshToken = userToken.refreshToken.toString();
    await _localStorage.writeTxn(() => _localStorage.userTokens.put(newData));
  }
}
