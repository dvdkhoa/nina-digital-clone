class PromotionModel {
  final int? id;
  final int? idUser;
  final int? idPromotion;
  final String? startDate;
  final String? endDate;
  final int? isUsed;
  final String? name;
  final String? type;
  final int? percent;
  final dynamic directReduction;
  final String? desc;
  final String? code;

  PromotionModel({
    this.id,
    this.idUser,
    this.idPromotion,
    this.startDate,
    this.endDate,
    this.isUsed,
    this.name,
    this.type,
    this.percent,
    this.directReduction,
    this.desc,
    this.code,
  });

  PromotionModel copyWith({
    int? id,
    int? idUser,
    int? idPromotion,
    String? startDate,
    String? endDate,
    int? isUsed,
    String? name,
    String? type,
    int? percent,
    dynamic directReduction,
    String? desc,
    String? code,
  }) {
    return PromotionModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idPromotion: idPromotion ?? this.idPromotion,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isUsed: isUsed ?? this.isUsed,
      name: name ?? this.name,
      type: type ?? this.type,
      percent: percent ?? this.percent,
      directReduction: directReduction ?? this.directReduction,
      desc: desc ?? this.desc,
      code: code ?? this.code,
    );
  }

  PromotionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idUser = json['id_user'] as int?,
        idPromotion = json['id_promotion'] as int?,
        startDate = json['start_date'] as String?,
        endDate = json['end_date'] as String?,
        isUsed = json['is_used'] as int?,
        name = json['name'] as String?,
        type = json['type'] as String?,
        percent = json['percent'] as int?,
        directReduction = json['direct_reduction'],
        desc = json['desc'] as String?,
        code = json['code'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': idUser,
        'id_promotion': idPromotion,
        'start_date': startDate,
        'end_date': endDate,
        'is_used': isUsed,
        'name': name,
        'type': type,
        'percent': percent,
        'direct_reduction': directReduction,
        'desc': desc,
        'code': code
      };
}
