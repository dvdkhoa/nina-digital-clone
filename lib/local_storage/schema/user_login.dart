import 'package:isar/isar.dart';

part 'user_login.g.dart';

@collection
class UserLogin {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? accessToken;
  String? refreshToken;
  String? dataUser;
}
