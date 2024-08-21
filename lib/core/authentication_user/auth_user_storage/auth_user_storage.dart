import '../../../local_storage/local_storage.dart';
import '../../../local_storage/schema/user_login.dart';
import '../../../shared/utils/helper.dart';

class AuthUserStorage {
  final _localStorage = LocalStorage.isarDB;

  String? _accessToken;
  String? _refreshToken;
  String? _dataUser;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get dataUser => _dataUser;

  void init() {
    final UserLogin userLogin = _getData() ?? UserLogin();
    _accessToken = userLogin.accessToken ?? '';
    _refreshToken = userLogin.refreshToken ?? '';
    _dataUser = userLogin.dataUser ?? '';
  }

  UserLogin? _getData() {
    // lây record -> ID: 1
    return _localStorage.userLogins.getSync(1);
  }

  Future<void> clearData() async {
    _accessToken = '';
    _refreshToken = '';
    _dataUser = '';
    UserLogin item = _getData() ?? UserLogin();
    await _localStorage.writeTxn(() => _localStorage.userLogins.put(item
      ..accessToken = ''
      ..refreshToken = ''
      ..dataUser = ''));
  }

  Future<void> saveData(
      {String? accessToken, String? refreshToken, String? dataUser}) async {
    UserLogin item = _getData()!;
    if (!Helper.isNull(accessToken)) {
      item.accessToken = accessToken;
    }
    if (!Helper.isNull(refreshToken)) {
      item.refreshToken = refreshToken;
    }
    if (!Helper.isNull(dataUser)) {
      item.dataUser = dataUser;
    }
    await _localStorage.writeTxn(() => _localStorage.userLogins.put(item));
  }
}
