class AddressModel {
  AddressModel({
    this.id,
    required this.idUser,
    required this.nameAddress,
    required this.nameRecipient,
    required this.phoneRecipient,
    required this.idCity,
    required this.idDistrict,
    required this.idWard,
    required this.detailAddress,
    required this.isDefault,
  });
  late int? id;
  late final int idUser;
  late final String nameAddress;
  late final String nameRecipient;
  late final String phoneRecipient;
  late final int idCity;
  late final int idDistrict;
  late final int idWard;
  late final String detailAddress;
  late final int isDefault;

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    nameAddress = json['name_address'];
    nameRecipient = json['name_recipient'];
    phoneRecipient = json['phone_recipient'];
    idCity = json['id_city'];
    idDistrict = json['id_district'];
    idWard = json['id_ward'];
    detailAddress = json['detail_address'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_user'] = idUser;
    _data['name_address'] = nameAddress;
    _data['name_recipient'] = nameRecipient;
    _data['phone_recipient'] = phoneRecipient;
    _data['id_city'] = idCity;
    _data['id_district'] = idDistrict;
    _data['id_ward'] = idWard;
    _data['detail_address'] = detailAddress;
    _data['is_default'] = isDefault;
    return _data;
  }
}
