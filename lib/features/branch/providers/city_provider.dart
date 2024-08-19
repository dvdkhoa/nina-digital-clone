import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../models/city_model.dart';
import '../repositories/city_repository.dart';

part 'city_provider.g.dart';


@riverpod
class AsyncCityNotifier extends _$AsyncCityNotifier {
  @override
  FutureOr<List<CityModel>> build() async {
    return _fetchCities();
  }

  Future<List<CityModel>> _fetchCities() async {
    final cityRepository = CityRepository(ref.watch(dioProvider));
    final res = await cityRepository.fetchCities();
    if(res != null && res['data'] != null) {
      final list = res['data'] as List;
      return list.map((e) => CityModel.fromJson(e)).toList();
    }
    return List.empty();
  }
}
