import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';
import '../models/AddressModel.dart';
import '../repositories/address_repository.dart';

part 'address_provider.g.dart';

@Riverpod(keepAlive: true)
class AsyncAddressNotifier extends _$AsyncAddressNotifier {
  @override
  FutureOr<List<AddressModel>> build() {
    return _fetchAddresses();
  }

  Future<List<AddressModel>> _fetchAddresses() async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    final res = await addressRepository.fetchAddresses(ApiUrl.ACCOUNT_ID);

    final list = res['data'] as List;
    final addresses = list.map((item) => AddressModel.fromJson(item)).toList();

    return addresses;
  }

  refreshAddress() async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return _fetchAddresses();
    });
  }

  addAddress(AddressModel address) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    bool result = await addressRepository.addAddress(address);

    if (result) {
      refreshAddress();
    }
  }

  updateAddress(AddressModel address) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    bool result = await addressRepository.updateAddress(address);

    if (result) {
      refreshAddress();
    }
  }

  deleteAddress(id) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    bool result = await addressRepository.deleteAddress(id);

    if (result) {
      refreshAddress();
    }
  }

   AddressModel? getDefaultAddress() {
    return state.value?.firstWhere((item) => item.isDefault == 1);
  }
}
