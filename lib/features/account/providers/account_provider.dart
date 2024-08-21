import 'dart:convert';
import 'dart:io';

import 'package:mime_type/mime_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/authentication_user/auth_user_storage/auth_user_storage.dart';
import '../../../core/authentication_user/model/user_model.dart';
import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../local_storage/local_storage.dart';
import '../../../local_storage/schema/user_login.dart';
import '../../../shared/utils/helper.dart';
import '../repositories/account_repository.dart';

part 'account_provider.g.dart';

@riverpod
class AsyncAccount extends _$AsyncAccount {
  late AccountRepository _accountRepository;
  final _localStorage = LocalStorage.isarDB;

  @override
  FutureOr<UserModel?> build() async {
    _accountRepository = ref.watch(accountRepositoryProvider);

    final userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    return userInfo;
  }

  Future changeAvatar(File file) async {
    state.whenData(
      (value) async {
        state = AsyncValue.loading();
        state = await AsyncValue.guard(
          () async {
            final userId = value?.id;
            final res = await _accountRepository.changeAvatar(userId!, file);
            if (res != null && res['data'] != null) {
              final newAvatar = res['data']['avatar'];

              final userLogin =
                  ref.read(authUserProvider.select((value) => value.userLogin));

              final newUserLogin = userLogin?.copyWith(avatar: newAvatar);

              await _updateUserStorage(data: newUserLogin?.toJson() ?? {});

              return value?.copyWith(avatar: newAvatar);
            }
            return value;
          },
        );
      },
    );
  }

  Future updateInfomation(fullname, nickname, dob, email, phone, gender) async {

    state.whenData(
      (value) async {

        state = AsyncValue.loading();

        if (!Helper.isNull(fullname)) {
          value = value?.copyWith(fullname: fullname);
        }
        if (!Helper.isNull(nickname)) {
          value = value?.copyWith(username: nickname);
        }
        if (!Helper.isNull(dob)) {
          value = value?.copyWith(birthday: dob);
        }
        if(!Helper.isNull(email)) {
          value = value?.copyWith(email: email);
        }
        if(!Helper.isNull(phone)) {
          value = value?.copyWith(phone: phone);
        }
        if(!Helper.isNull(gender)) {
          value = value?.copyWith(gender: gender);
        }

        state = await AsyncValue.guard(
          () async {
            final jsonData = value?.toJson();
            final res = await _accountRepository.updateInfomation(value?.id ?? 0, jsonData);
            if(res) {
              await _updateUserStorage(data: jsonData!);
            }
            return value;
          }
        );
      },
    );
  }

  Future<void> _updateUserStorage({required Map<String, dynamic> data}) async {
    final userLogin = _localStorage.userLogins.getSync(1);

    userLogin?.dataUser = jsonEncode(data);

    await _localStorage
        .writeTxn(() => _localStorage.userLogins.put(userLogin!));
  }
}
