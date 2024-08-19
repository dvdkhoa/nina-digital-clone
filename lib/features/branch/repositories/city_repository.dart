import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';


class CityRepository {
  final DioClient dioClient;

  CityRepository(this.dioClient);

  Future fetchCities() async {
    final response = await dioClient.get(ApiUrl.CITY);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
