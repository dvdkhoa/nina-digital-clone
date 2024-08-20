import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dio_client.dart';
import '../../../shared/providers/models/product_model.dart';
import '../repositories/product_repository.dart';

part 'product_homepage_provider.g.dart';

@Riverpod(keepAlive: true)
class AsyncProductHomePage extends _$AsyncProductHomePage {
  @override
  FutureOr<List<ProductModel>> build() {
    return _fetchProduct();
  }

  Future<List<ProductModel>> _fetchProduct() async {
    final productRepository = ProductRepository(ref.watch(dioProvider));

    final res = await productRepository.fetchProducts();

    if (res['data'] != null) {
      final list = res['data'] as List;
      final products = list.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    }
    return List.empty();
  }

}
