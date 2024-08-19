import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';


class CategoryRepository {
  final DioClient dioClient;

  CategoryRepository(this.dioClient);

  Future fetchCategories(int level, int id_parent) async {
    var data = new Map<String, dynamic>();
    if(level > 0){
      data['level'] = level;
      data['id_parent'] = id_parent;
    }
    final response = await dioClient.get(ApiUrl.PRODUCT_CATEGORY, queryParameters: level > 0 ? data : null);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
