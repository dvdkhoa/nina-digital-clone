class NewsModel {
  NewsModel({
    required this.id,
    required this.idList,
    required this.idItem,
    required this.idCat,
    required this.idSub,
    required this.photo,
    required this.options,
    required this.slugvi,
    required this.slugen,
    required this.contenten,
    required this.contentvi,
    required this.descen,
    required this.descvi,
    required this.nameen,
    required this.namevi,
    required this.numb,
    required this.status,
    required this.type,
    required this.dateCreated,
    required this.dateUpdated,
    required this.view,
    required this.icon,
    required this.linkMap,
    required this.linkLienhe,
  });
  late final int id;
  late final int idList;
  late final int idItem;
  late final int idCat;
  late final int idSub;
  late final String photo;
  late final String options;
  late final String slugvi;
  late final String slugen;
  late final String contenten;
  late final String contentvi;
  late final String descen;
  late final String descvi;
  late final String nameen;
  late final String namevi;
  late final int numb;
  late final String status;
  late final String type;
  late final int dateCreated;
  late final int dateUpdated;
  late final int view;
  late final String icon;
  late final String linkMap;
  late final String linkLienhe;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idList = json['id_list'];
    idItem = json['id_item'];
    idCat = json['id_cat'];
    idSub = json['id_sub'];
    photo = json['photo'];
    options = json['options'];
    slugvi = json['slugvi'];
    slugen = json['slugen'];
    contenten = json['contenten'];
    contentvi = json['contentvi'];
    descen = json['descen'];
    descvi = json['descvi'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    numb = json['numb'];
    status = json['status'];
    type = json['type'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    view = json['view'];
    icon = json['icon'];
    linkMap = json['link_map'];
    linkLienhe = json['link_lienhe'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_list'] = idList;
    _data['id_item'] = idItem;
    _data['id_cat'] = idCat;
    _data['id_sub'] = idSub;
    _data['photo'] = photo;
    _data['options'] = options;
    _data['slugvi'] = slugvi;
    _data['slugen'] = slugen;
    _data['contenten'] = contenten;
    _data['contentvi'] = contentvi;
    _data['descen'] = descen;
    _data['descvi'] = descvi;
    _data['nameen'] = nameen;
    _data['namevi'] = namevi;
    _data['numb'] = numb;
    _data['status'] = status;
    _data['type'] = type;
    _data['date_created'] = dateCreated;
    _data['date_updated'] = dateUpdated;
    _data['view'] = view;
    _data['icon'] = icon;
    _data['link_map'] = linkMap;
    _data['link_lienhe'] = linkLienhe;
    return _data;
  }
}
