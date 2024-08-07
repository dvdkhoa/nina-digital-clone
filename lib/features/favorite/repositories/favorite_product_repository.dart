import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class FavoriteProductRepository {
  final DioClient dioClient;

  FavoriteProductRepository(this.dioClient);

  Future fetchProducts(userId) async {
    final data = {"id_user": userId};
    final response = await dioClient.get('${ApiUrl.FAVORITE_PRODUCT}',
        queryParameters: data);
    // if (response.statusCode == 200) {
    //   return response.data;
    // }
    return response.data;
  }

  Future likeProduct(userId, productId) async {
    final data = {"id_user": userId, 'id_product': productId};
    final response =
        await dioClient.post('${ApiUrl.FAVORITE_PRODUCT}', data: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
