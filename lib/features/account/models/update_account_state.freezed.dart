// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateAccountState _$UpdateAccountStateFromJson(Map<String, dynamic> json) {
  return _UpdateAccountState.fromJson(json);
}

/// @nodoc
mixin _$UpdateAccountState {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  int? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateAccountStateCopyWith<UpdateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAccountStateCopyWith<$Res> {
  factory $UpdateAccountStateCopyWith(
          UpdateAccountState value, $Res Function(UpdateAccountState) then) =
      _$UpdateAccountStateCopyWithImpl<$Res, UpdateAccountState>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? fullname,
      String? phone,
      String? email,
      int? gender,
      int? birthday});
}

/// @nodoc
class _$UpdateAccountStateCopyWithImpl<$Res, $Val extends UpdateAccountState>
    implements $UpdateAccountStateCopyWith<$Res> {
  _$UpdateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateAccountStateImplCopyWith<$Res>
    implements $UpdateAccountStateCopyWith<$Res> {
  factory _$$UpdateAccountStateImplCopyWith(_$UpdateAccountStateImpl value,
          $Res Function(_$UpdateAccountStateImpl) then) =
      __$$UpdateAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? fullname,
      String? phone,
      String? email,
      int? gender,
      int? birthday});
}

/// @nodoc
class __$$UpdateAccountStateImplCopyWithImpl<$Res>
    extends _$UpdateAccountStateCopyWithImpl<$Res, _$UpdateAccountStateImpl>
    implements _$$UpdateAccountStateImplCopyWith<$Res> {
  __$$UpdateAccountStateImplCopyWithImpl(_$UpdateAccountStateImpl _value,
      $Res Function(_$UpdateAccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$UpdateAccountStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateAccountStateImpl implements _UpdateAccountState {
  const _$UpdateAccountStateImpl(
      {this.id,
      this.username,
      this.fullname,
      this.phone,
      this.email,
      this.gender,
      this.birthday});

  factory _$UpdateAccountStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAccountStateImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? fullname;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final int? gender;
  @override
  final int? birthday;

  @override
  String toString() {
    return 'UpdateAccountState(id: $id, username: $username, fullname: $fullname, phone: $phone, email: $email, gender: $gender, birthday: $birthday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAccountStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, fullname, phone, email, gender, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAccountStateImplCopyWith<_$UpdateAccountStateImpl> get copyWith =>
      __$$UpdateAccountStateImplCopyWithImpl<_$UpdateAccountStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAccountStateImplToJson(
      this,
    );
  }
}

abstract class _UpdateAccountState implements UpdateAccountState {
  const factory _UpdateAccountState(
      {final int? id,
      final String? username,
      final String? fullname,
      final String? phone,
      final String? email,
      final int? gender,
      final int? birthday}) = _$UpdateAccountStateImpl;

  factory _UpdateAccountState.fromJson(Map<String, dynamic> json) =
      _$UpdateAccountStateImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get fullname;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  int? get gender;
  @override
  int? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$UpdateAccountStateImplCopyWith<_$UpdateAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
