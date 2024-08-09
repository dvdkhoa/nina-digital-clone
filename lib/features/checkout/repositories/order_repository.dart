import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../models/order_model.dart';

class OrderRepository {
  final DioClient dioClient;

  OrderRepository(this.dioClient);

  Future fetchOrders(userId) async {
    final data = {"id_user": userId};
    final response = await dioClient.get(ApiUrl.ORDER, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future createOrder(OrderModel model) async {
    final data = model.toJson();
    print(data);

    final response = await dioClient.post(ApiUrl.CREATE_ORDER, data: data);

    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
