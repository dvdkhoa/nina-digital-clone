import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication_user/model/user_model.dart';
import '../../../core/authentication_user/providers/auth_user_provider.dart';
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
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    final favoriteProductRepository =
        FavoriteProductRepository(ref.watch(dioProvider));

    final res = await favoriteProductRepository.fetchProducts(userInfo?.id);

    if (res != null) {
      final list = res['data'] as List;
      final products = list.map((item) => ProductModel.fromJson(item)).toList();

      return products;
    }

    return List.empty();
  }
}
