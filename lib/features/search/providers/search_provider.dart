import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/providers/models/product_model.dart';
import '../repositories/search_repository.dart';
import 'search_state.dart';

part 'search_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchState build() {
    return SearchState(isLoading: true);
  }

  searchProducts(keyword) async {
    state = state.copyWith(isLoading: true);
    final searchProductRepository = SearchRepository(ref.watch(dioProvider));

    final res = await searchProductRepository.searchProducts(keyword);

    if (res.containsKey('data')) {
      final list = res['data'] as List;

      List<ProductModel> products =
          list.map((item) => ProductModel.fromJson(item)).toList();

      state = state.copyWith(isLoading: false, products: products);
    } else {
      state = state.copyWith(isLoading: false, products: []);
    }
  }
}
