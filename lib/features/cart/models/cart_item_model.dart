class CartItemModel {
  CartItemModel({
    required this.id,
    required this.idProduct,
    required this.quantity,
    required this.namevi,
    required this.nameen,
    required this.photo,
    required this.code,
    required this.regularPrice,
    required this.salePrice,
    required this.discount,
  });
  late final int id;
  late final int idProduct;
  late int quantity;
  late final String namevi;
  late final String nameen;
  late final String photo;
  late final String code;
  late final double regularPrice;
  late final double salePrice;
  late final int discount;

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduct = json['id_product'];
    quantity = json['quantity'];
    namevi = json['namevi'];
    nameen = json['nameen'];
    photo = json['photo'];
    code = json['code'];
    regularPrice = double.parse(json['regular_price'].toString());
    salePrice = double.parse(json['sale_price'].toString());
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_product'] = idProduct;
    _data['quantity'] = quantity;
    _data['namevi'] = namevi;
    _data['nameen'] = nameen;
    _data['photo'] = photo;
    _data['code'] = code;
    _data['regular_price'] = regularPrice;
    _data['sale_price'] = salePrice;
    _data['discount'] = discount;
    return _data;
  }

  CartItemModel copyWith({
    int? id,
    int? idProduct,
    int? quantity,
    String? namevi,
    String? nameen,
    String? photo,
    String? code,
    double? regularPrice,
    double? salePrice,
    int? discount,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      idProduct: idProduct ?? this.idProduct,
      quantity: quantity ?? this.quantity,
      namevi: namevi ?? this.namevi,
      nameen: nameen ?? this.nameen,
      photo: photo ?? this.photo,
      code: code ?? this.code,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice, // Allow null for salePrice
      discount: discount ?? this.discount,
    );
  }

  double getAmount() {
    if (this.salePrice != null) {
      return salePrice * quantity;
    }
    return regularPrice * quantity;
  }
}
