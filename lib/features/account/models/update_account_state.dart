import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_account_state.g.dart';
part 'update_account_state.freezed.dart';

@freezed
class UpdateAccountState with _$UpdateAccountState {
  const factory UpdateAccountState({
    int? id,
    String? username,
    String? fullname,
    String? phone,
    String? email,
    int? gender,
    int? birthday,
  }) = _UpdateAccountState;

  factory UpdateAccountState.fromJson(Map<String, Object?> json)
  => _$UpdateAccountStateFromJson(json);
}
