import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../models/district_model.dart';
import '../repositories/district_respository.dart';
import 'branch_provider.dart';

part 'district_provider.g.dart';

@riverpod
class AsyncDistrictNotifier extends _$AsyncDistrictNotifier {
  @override
  FutureOr<List<DistrictModel>> build() async {
    return [];
  }

  Future fetchDistrictByCityId(int cityId) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final cityRepository = DistrictRepository(ref.watch(dioProvider));
      final res = await cityRepository.fetchDistrict(cityId);
      if(res != null && res['data'] != null) {
        final list = res['data'] as List;
        final districts = list.map((e) => DistrictModel.fromJson(e)).toList();
        return districts;
      }
      return List.empty();
    },);
  }
}
