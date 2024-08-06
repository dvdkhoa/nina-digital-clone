class AddToCartModel {
  AddToCartModel(
      {required this.userId, required this.productId, required this.quantity});

  final int userId;
  final int productId;
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
        'quantity': quantity,
      };

  AddToCartModel copyWith({
    int? userId,
    int? productId,
    int? quantity,
  }) {
    return AddToCartModel(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
