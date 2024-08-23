class AddToCartModel {
  AddToCartModel(
      {required this.userId, required this.productId, this.colorId, required this.quantity});

  final int userId;
  final int productId;
  final int? colorId;
  final int quantity;

  // factory AddToCartModel.fromJson(Map<String, dynamic> json) {
  //   return AddToCartModel(
  //     userId: json['userId'] as int,
  //     productId: json['productId'] as int,
  //     quantity: json['quantity'] as int,
  //   );
  // }

  Map<String, dynamic> toJson() => {
        'id_user': userId,
        'id_product': productId,
        'id_color': colorId,
        'quantity': quantity,
      };

  AddToCartModel copyWith({
    int? userId,
    int? productId,
    int? colorId,
    int? quantity,
  }) {
    return AddToCartModel(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      colorId: colorId ?? this.colorId,
      quantity: quantity ?? this.quantity,
    );
  }
}
