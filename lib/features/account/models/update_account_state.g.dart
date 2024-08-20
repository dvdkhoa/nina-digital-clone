// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateAccountStateImpl _$$UpdateAccountStateImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateAccountStateImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      birthday: (json['birthday'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UpdateAccountStateImplToJson(
        _$UpdateAccountStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'birthday': instance.birthday,
    };
