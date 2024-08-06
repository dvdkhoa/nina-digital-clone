import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class PhotoRepository {
  final DioClient dioClient;

  PhotoRepository(this.dioClient);

  Future fetchSlides() async {
    final data = {"type": "slide-qc"};
    final response = await dioClient.get(ApiUrl.PHOTO, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
