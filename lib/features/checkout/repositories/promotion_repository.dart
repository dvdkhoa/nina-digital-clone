import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../../address/models/AddressModel.dart';

class PromotionRepository {
  final DioClient dioClient;

  PromotionRepository(this.dioClient);

  Future fetchPromotion(userId) async {
    final data = {"id_user": userId};
    final response =
        await dioClient.get(ApiUrl.PROMOTION, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
