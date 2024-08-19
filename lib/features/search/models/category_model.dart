class CategoryModel {
  final int? id;
  final String? slugvi;
  final String? slugen;
  final String? contenten;
  final String? contentvi;
  final String? descen;
  final String? descvi;
  final String? nameen;
  final String? namevi;
  final String? photo;
  final String? options;
  final int? numb;
  final String? status;
  final String? type;
  final int? dateCreated;
  final int? dateUpdated;
  final String? icon;

  CategoryModel({
    this.id,
    this.slugvi,
    this.slugen,
    this.contenten,
    this.contentvi,
    this.descen,
    this.descvi,
    this.nameen,
    this.namevi,
    this.photo,
    this.options,
    this.numb,
    this.status,
    this.type,
    this.dateCreated,
    this.dateUpdated,
    this.icon,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        slugvi = json['slugvi'] as String?,
        slugen = json['slugen'] as String?,
        contenten = json['contenten'] as String?,
        contentvi = json['contentvi'] as String?,
        descen = json['descen'] as String?,
        descvi = json['descvi'] as String?,
        nameen = json['nameen'] as String?,
        namevi = json['namevi'] as String?,
        photo = json['photo'] as String?,
        options = json['options'] as String?,
        numb = json['numb'] as int?,
        status = json['status'] as String?,
        type = json['type'] as String?,
        dateCreated = json['date_created'] as int?,
        dateUpdated = json['date_updated'] as int?,
        icon = json['icon'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'slugvi' : slugvi,
    'slugen' : slugen,
    'contenten' : contenten,
    'contentvi' : contentvi,
    'descen' : descen,
    'descvi' : descvi,
    'nameen' : nameen,
    'namevi' : namevi,
    'photo' : photo,
    'options' : options,
    'numb' : numb,
    'status' : status,
    'type' : type,
    'date_created' : dateCreated,
    'date_updated' : dateUpdated,
    'icon' : icon
  };
}