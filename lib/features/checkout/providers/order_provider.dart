import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication_user/model/user_model.dart';
import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../core/services/dio_client.dart';
import '../../cart/providers/cart_provider.dart';
import '../models/order_model.dart';
import '../repositories/order_repository.dart';

part 'order_provider.g.dart';

@Riverpod(keepAlive: false)
class AsyncOrderNotifier extends _$AsyncOrderNotifier {
  @override
  FutureOr<List<OrderModel>> build() {
    return _fetchOrders();
  }

  Future<List<OrderModel>> _fetchOrders() async {
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    final orderRepository = OrderRepository(ref.watch(dioProvider));
    final res =
        await orderRepository.fetchOrders(userInfo?.id) as Map<String, dynamic>;
    if (res != null && res.containsKey('data')) {
      final list = res['data']['orders'] as List;
      final orders = list.map((item) => OrderModel.fromJson(item)).toList();

      return orders;
    }
    return List.empty();
  }

  Future createOrder(OrderModel order) async {
    final orderRepository = OrderRepository(ref.watch(dioProvider));

    final res = await orderRepository.createOrder(order);

    if (res != null && res['data'] != null) {
      // thành công
      ref.read(cartProvider.notifier).getCart();
    }
  }
}
