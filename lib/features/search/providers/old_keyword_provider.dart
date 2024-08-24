import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../local_storage/local_storage.dart';
import '../../../local_storage/schema/old_search.dart';
import '../../../shared/utils/helper.dart';

part 'old_keyword_provider.g.dart';

@riverpod
class AsyncOldKeyword extends _$AsyncOldKeyword {
  final _localStorage = LocalStorage.isarDB;

  @override
  FutureOr<List<OldSearch?>> build(userId) async {
    return _fetchOldKeyword();
  }

  Future<List<OldSearch?>> _fetchOldKeyword() async {
    final old_searchs = await _localStorage.oldSearchs.where().sortByDatetimeDesc().limit(10).findAll();

        if (old_searchs.isNotEmpty) {
      return old_searchs;
    }
    return [];
  }

  Future createSearch(String keyword) async {

    if(Helper.isNull(keyword))
      return;

    final oldSearchKeywords = await _getOldSeachKeywords(keyword);

    if(oldSearchKeywords.isNotEmpty) {
      _delete(oldSearchKeywords);
    }

    final search = OldSearch()
      ..keyword = keyword
      ..datetime = DateTime.now();

    await _localStorage.writeTxn(() async {
      await _localStorage.oldSearchs.put(search);
      state.value?.insert(0, search);
    },);
  }

  Future<List<OldSearch>> _getOldSeachKeywords(String keyword) async {
    return _localStorage.oldSearchs.filter().keywordEqualTo(keyword).findAll();
  }



  Future delete(OldSearch item) async {
    await _delete([item]);
  }

  Future deleteAll() async {
    await _localStorage.writeTxn(() async {
      await _localStorage.oldSearchs.clear();
    },);
    await _refresh();
  }

  Future _delete(List<OldSearch> list) async {
    final ids = list.map((e) => e.id,).toList();
    await _localStorage.writeTxn(() async {
      await _localStorage.oldSearchs.deleteAll(ids);
    },);
    await _refresh();
  }

  Future _refresh() async {
    state = await AsyncValue.guard(() async {
      return await _fetchOldKeyword();
    },);
  }

}
