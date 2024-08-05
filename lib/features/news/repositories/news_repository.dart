import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

class NewsRepository {
  final DioClient dioClient;

  NewsRepository(this.dioClient);

  Future fetchNews(type) async {
    final data = {"type": type};
    final response = await dioClient.get(ApiUrl.NEWS, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future getDetailNews(id) async {
    final response = await dioClient.get('${ApiUrl.NEWS}/${id}');
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
