class BranchModel {
  final int? id;
  final String? address;
  final String? photo;
  final String? phone;
  final String? googleMap;
  final int? idCity;
  final int? idDistrict;
  final String? status;

  BranchModel({
    this.id,
    this.address,
    this.photo,
    this.phone,
    this.googleMap,
    this.idCity,
    this.idDistrict,
    this.status,
  });

  BranchModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        address = json['address'] as String?,
        photo = json['photo'] as String?,
        phone = json['phone'] as String?,
        googleMap = json['google_map'] as String?,
        idCity = json['id_city'] as int?,
        idDistrict = json['id_district'] as int?,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'address' : address,
    'photo' : photo,
    'phone' : phone,
    'google_map' : googleMap,
    'id_city' : idCity,
    'id_district' : idDistrict,
    'status' : status
  };
}