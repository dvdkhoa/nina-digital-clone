class DistrictModel {
  final int? id;
  final int? idCity;
  final int? districtID;
  final int? provinceID;
  final String? name;
  final String? slug;
  final int? code;
  final int? numb;
  final String? status;
  final int? dateCreated;
  final int? dateUpdated;

  DistrictModel({
    this.id,
    this.idCity,
    this.districtID,
    this.provinceID,
    this.name,
    this.slug,
    this.code,
    this.numb,
    this.status,
    this.dateCreated,
    this.dateUpdated,
  });

  DistrictModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idCity = json['id_city'] as int?,
        districtID = json['DistrictID'] as int?,
        provinceID = json['ProvinceID'] as int?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        code = json['code'] as int?,
        numb = json['numb'] as int?,
        status = json['status'] as String?,
        dateCreated = json['date_created'] as int?,
        dateUpdated = json['date_updated'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'id_city' : idCity,
    'DistrictID' : districtID,
    'ProvinceID' : provinceID,
    'name' : name,
    'slug' : slug,
    'code' : code,
    'numb' : numb,
    'status' : status,
    'date_created' : dateCreated,
    'date_updated' : dateUpdated
  };
}