import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../models/order_status_model.dart';
import '../repositories/order_status_repository.dart';

final orderStatusProvider = FutureProvider<List<OrderStatusModel>>((ref) async {
  final orderStatusRepository = OrderStatusRepository(ref.watch(dioProvider));

  final res = await orderStatusRepository.fetchOrderStatus();
  if (res != null && res['data'] != null) {
    final list = res['data'] as List;
    final list_status = list.map((e) => OrderStatusModel.fromJson(e)).toList();

    return list_status;
  }
  return List.empty();
});
