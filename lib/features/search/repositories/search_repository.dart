import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';


class SearchRepository {
  final DioClient dioClient;

  SearchRepository(this.dioClient);

  Future searchProducts(keyword) async {
    final data = {"keyword": keyword};
    final response = await dioClient.get(ApiUrl.PRODUCT, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
