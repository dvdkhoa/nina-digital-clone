import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future getDetailProduct(id) async {
    final response = await dioClient.get('${ApiUrl.PRODUCT}/$id');
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
