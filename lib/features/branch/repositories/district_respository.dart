import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';


class DistrictRepository {
  final DioClient dioClient;

  DistrictRepository(this.dioClient);

  Future fetchDistrict(int cityId) async {
    final data = {
      "id_city": cityId
    };
    final response = await dioClient.get(ApiUrl.DISTRICTS, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
