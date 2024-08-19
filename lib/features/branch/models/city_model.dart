class CityModel {
  final int? id;
  final String? name;
  final String? slug;
  final int? code;
  final int? provinceID;
  final int? countryID;
  final int? numb;
  final String? status;
  final int? dateCreated;
  final int? dateUpdated;

  CityModel({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.provinceID,
    this.countryID,
    this.numb,
    this.status,
    this.dateCreated,
    this.dateUpdated,
  });

  CityModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        code = json['code'] as int?,
        provinceID = json['ProvinceID'] as int?,
        countryID = json['CountryID'] as int?,
        numb = json['numb'] as int?,
        status = json['status'] as String?,
        dateCreated = json['date_created'] as int?,
        dateUpdated = json['date_updated'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'slug' : slug,
    'code' : code,
    'ProvinceID' : provinceID,
    'CountryID' : countryID,
    'numb' : numb,
    'status' : status,
    'date_created' : dateCreated,
    'date_updated' : dateUpdated
  };
}