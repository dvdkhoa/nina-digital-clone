import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../local_storage/local_storage.dart';
import '../../../local_storage/schema/old_search.dart';

part 'old_keyword_provider.g.dart';

@riverpod
class AsyncOldKeyword extends _$AsyncOldKeyword {
  final _localStorage = LocalStorage.isarDB;

  @override
  FutureOr<List<OldSearch?>> build(userId) async {
    return _fetchOldKeyword();
  }

  Future<List<OldSearch?>> _fetchOldKeyword() async {
    final old_searchs = await _localStorage.oldSearchs.getAll([]);

    if (old_searchs.isNotEmpty) {
      return old_searchs;
    }
    return [];
  }

  Future createSearch(String keyword) async {
    final search = OldSearch()
      ..keyword = keyword
      ..datetime = DateTime.now();

    await _localStorage.writeTxn(() async {
      await _localStorage.oldSearchs.put(search);
      state.value?.add(search);
    },);
  }
}
