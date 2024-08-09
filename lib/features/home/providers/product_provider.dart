import 'package:nina_digital/shared/providers/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../repositories/product_repository.dart';
import 'states/product_state.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
class AsyncProductNotifier extends _$AsyncProductNotifier {
  @override
  FutureOr<ProductPagingState> build() {
    return _fetchProduct();
  }

  Future<ProductPagingState> _fetchProduct() async {
    final productRepository = ProductRepository(ref.watch(dioProvider));

    final res = await productRepository.fetchProducts();

    if (res['data'] != null) {
      final list = res['data'] as List;
      final products = list.map((e) => ProductModel.fromJson(e)).toList();

      final totalPage = res['pagination']['total_pages'];
      final currentPage = res['pagination']['current_page'];

      return ProductPagingState(
          products: products, currentPage: currentPage, totalPage: totalPage);
    }
    return ProductPagingState();
  }

  _getProductPaging() async {
    state.whenData(
      (value) async {
        final productRepository = ProductRepository(ref.watch(dioProvider));

        final res =
            await productRepository.fetchProductsPaging(value.currentPage! + 1);

        if (res['data'] != null) {
          final list = res['data'] as List;
          final newProducts =
              list.map((e) => ProductModel.fromJson(e)).toList();

          final totalPage = res['pagination']['total_pages'];
          final currentPage = res['pagination']['current_page'];

          value.products?.addAll(newProducts);

          state =
              AsyncData(value.copyWith(current: currentPage, total: totalPage));
        }
      },
    );
  }

  Future loadMoreProduct() async {
    await _getProductPaging();
  }
}
