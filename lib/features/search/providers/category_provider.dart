import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../models/category_model.dart';
import '../repositories/category_repository.dart';

part 'category_provider.g.dart';

@Riverpod(keepAlive: true)
class CategoryProvider extends _$CategoryProvider {
  @override
  FutureOr<List<CategoryModel>> build({ int level = 1, int id_parent = 0 }) async => fetchCategory(level, id_parent);

  Future<List<CategoryModel>> fetchCategory(int level, id_parent) async {
    final categoriesRepository = CategoryRepository(ref.watch(dioProvider));

    final res = await categoriesRepository.fetchCategories(level, id_parent);

    if(res != null && res['data'] != null) {
      final list = res['data'] as List;
      final categories = list.map((e)=>CategoryModel.fromJson(e)).toList();

      return categories;
    }
    return List.empty();
  }
}
