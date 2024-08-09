import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class OrderStatusRepository {
  final DioClient dioClient;

  OrderStatusRepository(this.dioClient);

  Future fetchOrderStatus() async {
    final response = await dioClient.get(ApiUrl.ORDER_STATUS);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
