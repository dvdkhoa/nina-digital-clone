import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../models/AddressModel.dart';

class AddressRepository {
  final DioClient dioClient;

  AddressRepository(this.dioClient);

  Future fetchAddresses(userId) async {
    final data = {"id_user": userId};
    final response = await dioClient.get(ApiUrl.ADDRESS, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  addAddress(AddressModel address) async {
    final data = address.toJson();

    final response = await dioClient.post(ApiUrl.ADDRESS, data: data);

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<bool> updateAddress(AddressModel address) async {
    final data = address.toJson();

    final response = await dioClient.put(ApiUrl.ADDRESS, data: data);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteAddress(id) async {
    final response = await dioClient.delete('${ApiUrl.ADDRESS}/$id');

    if (response['code'] == 200) {
      return true;
    }
    return false;
  }
}
