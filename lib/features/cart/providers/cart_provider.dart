import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';
import '../cart_repositories/cart_repository.dart';
import '../models/add_to_cart_model.dart';
import '../models/cart_item_model.dart';

part 'cart_state.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState();
  }

  getCart() async {
    _refreshCart();
  }

  _refreshCart() async {
    final List<CartItemModel> ds = await _fetchCart();
    state = state.copyWith(dsCart: ds, total: _getTotalQuantity(ds));
  }

  int _getTotalQuantity(List<CartItemModel> list) {
    int sum = 0;
    list.forEach((item) {
      sum += item.quantity;
    });
    return sum;
  }

  _fetchCart() async {
    final cartRepository = CartRepository(ref.watch(dioProvider));
    final res = await cartRepository.getCart(ApiUrl.ACCOUNT_ID);

    final list = res['data']['cart_items'] as List;

    final cartItems = list.map((item) => CartItemModel.fromJson(item)).toList();

    return cartItems;
  }

  changeQuantity(id_product, quantity) async {
    // CALL API
    final cartRepository = CartRepository(ref.watch(dioProvider));
    final res = await cartRepository.updateCart(
        ApiUrl.ACCOUNT_ID, id_product, quantity);

    final kq = int.parse(res['data']['kq'].toString());

    if (kq >= 0) {
      final list = state.dsCart;
      final newList = [
        for (final item in list!)
          if (item.idProduct == id_product)
            item.copyWith(quantity: quantity)
          else
            item
      ];

      state =
          state.copyWith(dsCart: newList, total: _getTotalQuantity(newList));
    }
  }

  Future<bool> addToCart(int productId, int quantity) async {
    final cartRepository = CartRepository(ref.watch(dioProvider));

    final addToCartModel = AddToCartModel(
        userId: int.parse(ApiUrl.ACCOUNT_ID),
        productId: productId,
        quantity: quantity);

    final res = await cartRepository.addToCart(addToCartModel);

    final count = int.parse(res['data']['countCart'].toString());
    if (count > 0) {
      await _refreshCart();
      return true;
    }
    return false;
  }

  removeCartItem(id) async {
    final cartRepository = CartRepository(ref.watch(dioProvider));
    final kq = await cartRepository.deleteCart(id);

    if (kq != null) {
      final newList = [
        for (final item in state.dsCart!)
          if (item.id != id) item,
      ];

      state =
          state.copyWith(dsCart: newList, total: _getTotalQuantity(newList));
      return true;
    }
    return false;
  }

  double totalPrice() {
    double total = 0;
    for (final item in state.dsCart!) {
      total += item.getAmount();
    }
    return total;
  }
}

final cartProvider = NotifierProvider<CartNotifier, CartState>(() {
  return CartNotifier();
});