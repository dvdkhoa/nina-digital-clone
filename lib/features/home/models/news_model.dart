class NewsModel {
  NewsModel({
    required this.id,
    required this.photo,
    required this.contenten,
    required this.contentvi,
    required this.descen,
    required this.descvi,
    required this.nameen,
    required this.namevi,
    required this.link,
    required this.linkVideo,
    required this.options,
    required this.type,
    required this.act,
    required this.numb,
    required this.status,
    required this.dateCreated,
    required this.dateUpdated,
    required this.link2,
    required this.loaidieuhuong,
  });
  late final int id;
  late final String photo;
  late final String contenten;
  late final String contentvi;
  late final String descen;
  late final String descvi;
  late final String nameen;
  late final String namevi;
  late final String link;
  late final String linkVideo;
  late final String options;
  late final String type;
  late final String act;
  late final int numb;
  late final String status;
  late final int dateCreated;
  late final int dateUpdated;
  late final String link2;
  late final int loaidieuhuong;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    contenten = json['contenten'];
    contentvi = json['contentvi'];
    descen = json['descen'];
    descvi = json['descvi'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    link = json['link'];
    linkVideo = json['link_video'];
    options = json['options'];
    type = json['type'];
    act = json['act'];
    numb = json['numb'];
    status = json['status'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    link2 = json['link2'];
    loaidieuhuong = json['loaidieuhuong'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['photo'] = photo;
    _data['contenten'] = contenten;
    _data['contentvi'] = contentvi;
    _data['descen'] = descen;
    _data['descvi'] = descvi;
    _data['nameen'] = nameen;
    _data['namevi'] = namevi;
    _data['link'] = link;
    _data['link_video'] = linkVideo;
    _data['options'] = options;
    _data['type'] = type;
    _data['act'] = act;
    _data['numb'] = numb;
    _data['status'] = status;
    _data['date_created'] = dateCreated;
    _data['date_updated'] = dateUpdated;
    _data['link2'] = link2;
    _data['loaidieuhuong'] = loaidieuhuong;
    return _data;
  }
}
