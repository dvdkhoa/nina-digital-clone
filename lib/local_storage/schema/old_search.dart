import 'package:isar/isar.dart';

part 'old_search.g.dart';

@Collection()
class OldSearch{
  Id? id = Isar.autoIncrement;
  late String keyword;
  late DateTime datetime;
}