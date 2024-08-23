import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import 'schema/old_search.dart';
import 'schema/settings.dart';
import 'schema/user_login.dart';

class LocalStorage {
  static late final Isar isarDB;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isarDB = await Isar.open(
      [SettingsSchema, UserLoginSchema, OldSearchSchema],
      directory: dir.path,
      inspector: true,
    );
  }
}
