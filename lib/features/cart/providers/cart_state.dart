part of 'cart_provider.dart';

class CartState {
  final List<CartItemModel>? dsCart;
  final int total;


  CartState({this.dsCart, this.total = 0});

  copyWith({List<CartItemModel>? dsCart, int? total}) {
    return CartState(
      dsCart: dsCart ?? this.dsCart,
      total: total ?? this.total,
    );
  }
}
