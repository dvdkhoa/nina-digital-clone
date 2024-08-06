import '../../../shared/providers/models/product_model.dart';

class SearchState {
  List<ProductModel>? products = [];
  bool isLoading;
  SearchState({this.products, this.isLoading = false});

  SearchState copyWith({List<ProductModel>? products, bool? isLoading}) {
    return SearchState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading);
  }
}
