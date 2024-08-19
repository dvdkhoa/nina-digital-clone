import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/shared/constants/api_url.dart';

import '../../../shared/utils/helper.dart';


class BranchRepository {
  final DioClient dioClient;

  BranchRepository(this.dioClient);

  Future fetchBranches(int? cityId, int? districtId) async {
    Map<String, dynamic> data = {};

    if(!Helper.isNull(cityId)) {
      data['id_city'] = cityId;
    }
    if(!Helper.isNull(districtId)) {
      data['id_district'] = districtId;
    }

    final response = await dioClient.get(ApiUrl.BRANCHES, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future getAllQuantityBranches() async {
    final response = await dioClient.get(ApiUrl.QUANTITY_BRANCHES);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
