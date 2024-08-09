class OrderStatusModel {
  final int? id;
  final String? namevi;
  final String? nameen;
  final String? classOrder;

  OrderStatusModel({
    this.id,
    this.namevi,
    this.nameen,
    this.classOrder,
  });

  OrderStatusModel copyWith({
    int? id,
    String? namevi,
    String? nameen,
    String? classOrder,
  }) {
    return OrderStatusModel(
      id: id ?? this.id,
      namevi: namevi ?? this.namevi,
      nameen: nameen ?? this.nameen,
      classOrder: classOrder ?? this.classOrder,
    );
  }

  OrderStatusModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        namevi = json['namevi'] as String?,
        nameen = json['nameen'] as String?,
        classOrder = json['class_order'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'namevi': namevi, 'nameen': nameen, 'class_order': classOrder};
}
