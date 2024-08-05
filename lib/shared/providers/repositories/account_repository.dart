import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class AccountRepository {
  final DioClient dioClient;

  AccountRepository(this.dioClient);

  Future getInfo(id) async {
    final response = await dioClient.get('${ApiUrl.ACCOUNT}/$id');
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future getFavoriteProducts(String userId) async {
    final response = await dioClient.get('${ApiUrl.ACCOUNT}/$userId');
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
