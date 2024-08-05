import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../models/add_to_cart_model.dart';

class CartRepository {
  final DioClient dioClient;

  CartRepository(this.dioClient);

  Future getCart(userId) async {
    final data = {"id_user": userId};
    final response = await dioClient.get(ApiUrl.CART, queryParameters: data);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Lỗi: ${response}');
    }
  }

  Future addToCart(AddToCartModel model) async {
    final data = model.toJson();
    final response = await dioClient.post(ApiUrl.CART, data: data);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Lỗi: ${response}');
    }
  }

  Future updateCart(id_user, id_product, quantity) async {
    final data = {
      "id_user": id_user,
      "id_product": id_product,
      "quantity": quantity
    };
    final response = await dioClient.put(ApiUrl.CART, data: data);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Lỗi: ${response}');
    }
  }

  Future deleteCart(id) async {
    final response = await dioClient.delete('${ApiUrl.CART}/$id');

    if (response['code'] == 200) {
      return response;
    } else {
      print('Lỗi: ${response}');
    }
  }
}
