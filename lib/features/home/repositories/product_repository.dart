import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future fetchProducts() async {
    final response = await dioClient.get(ApiUrl.PRODUCT);
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future fetchProductCategories($level) async {
    final data = {'level': $level};
    final response =
        await dioClient.get(ApiUrl.PRODUCT_CATEGORY, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
