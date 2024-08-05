class ProductListModel {
  ProductListModel({
    required this.id,
    required this.slugvi,
    required this.slugen,
    required this.contenten,
    required this.contentvi,
    required this.descen,
    required this.descvi,
    required this.nameen,
    required this.namevi,
    required this.photo,
    required this.options,
    required this.numb,
    required this.status,
    required this.type,
    required this.dateCreated,
    required this.dateUpdated,
    required this.icon,
  });
  late final int id;
  late final String slugvi;
  late final String slugen;
  late final String contenten;
  late final String contentvi;
  late final String descen;
  late final String descvi;
  late final String nameen;
  late final String namevi;
  late final String photo;
  late final String options;
  late final int numb;
  late final String status;
  late final String type;
  late final int dateCreated;
  late final int dateUpdated;
  late final String icon;

  ProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slugvi = json['slugvi'];
    slugen = json['slugen'];
    contenten = json['contenten'];
    contentvi = json['contentvi'];
    descen = json['descen'];
    descvi = json['descvi'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    photo = json['photo'];
    options = json['options'];
    numb = json['numb'];
    status = json['status'];
    type = json['type'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slugvi'] = slugvi;
    _data['slugen'] = slugen;
    _data['contenten'] = contenten;
    _data['contentvi'] = contentvi;
    _data['descen'] = descen;
    _data['descvi'] = descvi;
    _data['nameen'] = nameen;
    _data['namevi'] = namevi;
    _data['photo'] = photo;
    _data['options'] = options;
    _data['numb'] = numb;
    _data['status'] = status;
    _data['type'] = type;
    _data['date_created'] = dateCreated;
    _data['date_updated'] = dateUpdated;
    _data['icon'] = icon;
    return _data;
  }
}
