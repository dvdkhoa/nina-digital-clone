class PromotionModel {
  PromotionModel({
    required this.id,
    required this.idUser,
    required this.idPromotion,
    required this.startDate,
    required this.endDate,
    required this.isUsed,
    required this.name,
    required this.type,
    required this.percent,
    this.directReduction,
    required this.desc,
    required this.code,
  });
  late final int id;
  late final int idUser;
  late final int idPromotion;
  late final String startDate;
  late final String endDate;
  late final int isUsed;
  late final String name;
  late final String type;
  late final int percent;
  late final Null directReduction;
  late final String desc;
  late final String code;

  PromotionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idPromotion = json['id_promotion'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isUsed = json['is_used'];
    name = json['name'];
    type = json['type'];
    percent = json['percent'];
    directReduction = null;
    desc = json['desc'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_user'] = idUser;
    _data['id_promotion'] = idPromotion;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['is_used'] = isUsed;
    _data['name'] = name;
    _data['type'] = type;
    _data['percent'] = percent;
    _data['direct_reduction'] = directReduction;
    _data['desc'] = desc;
    _data['code'] = code;
    return _data;
  }
}
