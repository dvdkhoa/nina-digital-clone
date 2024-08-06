import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication_user/model/user_model.dart';
import '../../../core/authentication_user/providers/auth_user_provider.dart';
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
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    final addressRepository = AddressRepository(ref.watch(dioProvider));
    final res = await addressRepository.fetchAddresses(userInfo?.id)
        as Map<String, dynamic>;
    if (res != null && res.containsKey('data')) {
      final list = res['data'] as List;
      final addresses =
          list.map((item) => AddressModel.fromJson(item)).toList();

      return addresses;
    }
    return List.empty();
  }

  refreshAddress() async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return _fetchAddresses();
    });
  }

  addAddress(AddressModel address) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    final result =
        await addressRepository.addAddress(address) as Map<String, dynamic>;

    if (result != null) {
      state.whenData(
        (List<AddressModel> list) {
          final temp = result['data']['insertId'].toString();
          address.id = int.parse(temp);
          list.add(address);
          state = AsyncData(list);
        },
      );
    }
  }

  updateAddress(AddressModel address) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    bool result = await addressRepository.updateAddress(address);

    if (result) {
      state.whenData((list) {
        for (int i = 0; i < list.length; i++) {
          if (list[i].id == address.id) {
            list[i] = address;
            break; // Thoát vòng lặp khi tìm thấy
          }
        }
        state = AsyncValue.data(list);
      });
    }
  }

  deleteAddress(id) async {
    final addressRepository = AddressRepository(ref.watch(dioProvider));
    bool result = await addressRepository.deleteAddress(id);

    if (result) {
      state.whenData((list) {
        final item = list.firstWhere(
          (element) => element.id == id,
        );

        list.remove(item);

        state = AsyncValue.data(list);
      });
    }
  }

  AddressModel? getDefaultAddress() {
    return state.value?.firstWhere((item) => item.isDefault == 1);
  }
}
