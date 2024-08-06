import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/providers/models/product_model.dart';
import '../repositories/favorite_product_repository.dart';

part 'favorite_product_provider.g.dart';

@riverpod
class AsyncFavoriteProduct extends _$AsyncFavoriteProduct {
  @override
  FutureOr<List<ProductModel>> build() async {
    return _getFavoriteProduct();
  }

  Future<List<ProductModel>> _getFavoriteProduct() async {
    final favoriteProductRepository =
        FavoriteProductRepository(ref.watch(dioProvider));

    final res = await favoriteProductRepository.fetchProducts();

    final list = res['data'] as List;
    final products = list.map((item) => ProductModel.fromJson(item)).toList();

    return products;
  }
}
