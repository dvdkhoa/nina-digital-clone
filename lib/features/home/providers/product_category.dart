import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/features/home/models/product_list_model.dart';
import 'package:nina_digital/features/home/repositories/product_repository.dart';

final productCategoryListProvider =
    FutureProvider.autoDispose<List<ProductListModel>>((ref) async {
  final productRepository = ProductRepository(ref.watch(dioProvider));

  final res = await productRepository.fetchProductCategories(1);

  final list = res['data'] as List;

  final proLists = list.map((item) => ProductListModel.fromJson(item)).toList();

  return proLists;
});
