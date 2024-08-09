import 'package:nina_digital/shared/providers/models/product_model.dart';

class ProductPagingState {
  List<ProductModel>? products = List.empty();
  int? totalPage = 1;
  int? currentPage = 1;

  ProductPagingState(
      {this.products, this.totalPage, this.currentPage});

  ProductPagingState copyWith(
      {List<ProductModel>? products,
      int? total,
      int? current,
      bool? isLoadingMore}) {
    return ProductPagingState(
        products: products ?? this.products,
        totalPage: total ?? this.totalPage,
        currentPage: current ?? this.currentPage);
  }
}
