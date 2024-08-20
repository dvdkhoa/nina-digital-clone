import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../models/update_account_state.dart';
import 'account_provider.dart';

part 'update_account_provider.g.dart';

@Riverpod(keepAlive: false)
class UpdateAccount extends _$UpdateAccount {
  @override
  UpdateAccountState build() {
    final asyncUserInfo = ref.watch(asyncAccountProvider);

    final jsonData = asyncUserInfo.value?.toJson();

    final UpdateAccountState state = UpdateAccountState.fromJson(jsonData!);

    return state;

    return UpdateAccountState();
  }

  void onChangeFullname(String value) {
    print(value);
    state = state.copyWith(fullname: value);
  }

  void onChangeUsername(String value) {
    state = state.copyWith(username: value);
  }

  void onChangeBirthDay(DateTime date) {
    state = state.copyWith(birthday: date.millisecondsSinceEpoch);
  }

  void onChangeEmail(String value) {
    state = state.copyWith(email: value);
  }

  void onChangePhone(String value) {
    state = state.copyWith(phone: value);
  }

  void onChangeGender(int gender) {
    state = state.copyWith(gender: gender);
  }
}
