class OrderModel {
  final int? id;
  final int? idUser;
  final String? code;
  final String? fullname;
  final String? phone;
  final String? address;
  final String? email;
  final int? orderPayment;
  final double? tempPrice;
  final double? totalPrice;
  final double? priceSale;
  final int? city;
  final int? district;
  final int? ward;
  final double? shipPrice;
  final String? requirements;
  final String? notes;
  final int? dateCreated;
  final int? orderStatus;
  final int? numb;
  final int? tichdiem;
  final List<Details>? details;

  OrderModel({
    this.id,
    this.idUser,
    this.code,
    this.fullname,
    this.phone,
    this.address,
    this.email,
    this.orderPayment,
    this.tempPrice,
    this.totalPrice,
    this.priceSale,
    this.city,
    this.district,
    this.ward,
    this.shipPrice,
    this.requirements,
    this.notes,
    this.dateCreated,
    this.orderStatus,
    this.numb,
    this.tichdiem,
    this.details,
  });

  OrderModel copyWith({
    int? id,
    int? idUser,
    String? code,
    String? fullname,
    String? phone,
    String? address,
    String? email,
    int? orderPayment,
    double? tempPrice,
    double? totalPrice,
    double? priceSale,
    int? city,
    int? district,
    int? ward,
    double? shipPrice,
    String? requirements,
    String? notes,
    int? dateCreated,
    int? orderStatus,
    int? numb,
    int? tichdiem,
    List<Details>? details,
  }) {
    return OrderModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      code: code ?? this.code,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      email: email ?? this.email,
      orderPayment: orderPayment ?? this.orderPayment,
      tempPrice: tempPrice ?? this.tempPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      priceSale: priceSale ?? this.priceSale,
      city: city ?? this.city,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      shipPrice: shipPrice ?? this.shipPrice,
      requirements: requirements ?? this.requirements,
      notes: notes ?? this.notes,
      dateCreated: dateCreated ?? this.dateCreated,
      orderStatus: orderStatus ?? this.orderStatus,
      numb: numb ?? this.numb,
      tichdiem: tichdiem ?? this.tichdiem,
      details: details ?? this.details,
    );
  }

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idUser = json['id_user'] as int?,
        code = json['code'] as String?,
        fullname = json['fullname'] as String?,
        phone = json['phone'] as String?,
        address = json['address'] as String?,
        email = json['email'] as String?,
        orderPayment = json['order_payment'] as int?,
        tempPrice = double.parse(json['temp_price'].toString()),
        totalPrice = double.parse(json['total_price'].toString()),
        priceSale = double.parse(json['price_sale'].toString()),
        city = json['city'] as int?,
        district = json['district'] as int?,
        ward = json['ward'] as int?,
        shipPrice = double.parse(json['ship_price'].toString()),
        requirements = json['requirements'] as String?,
        notes = json['notes'] as String?,
        dateCreated = json['date_created'] as int?,
        orderStatus = json['order_status'] as int?,
        numb = json['numb'] as int?,
        tichdiem = json['tichdiem'] as int?,
        details = (json['details'] as List?)
            ?.map((dynamic e) => Details.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'id_user': idUser,
        // 'code': code,
        'fullname': fullname,
        'phone': phone,
        'address': address,
        'email': email,
        'order_payment': orderPayment,
        'temp_price': tempPrice,
        'total_price': totalPrice,
        'price_sale': priceSale,
        'city': city,
        'district': district,
        'ward': ward,
        'ship_price': shipPrice,
        'requirements': requirements,
        'notes': notes,
        // 'date_created': dateCreated,
        'order_status': orderStatus,
        // 'numb': numb,
        // 'tichdiem': tichdiem,
        // 'details': details?.map((e) => e.toJson()).toList()
      };
}

class Details {
  final int? id;
  final int? idOrder;
  final int? idProduct;
  final String? photo;
  final String? photoColor;
  final String? name;
  final String? code;
  final String? color;
  final String? baohanh;
  final String? size;
  final int? regularPrice;
  final int? salePrice;
  final int? quantity;

  Details({
    this.id,
    this.idOrder,
    this.idProduct,
    this.photo,
    this.photoColor,
    this.name,
    this.code,
    this.color,
    this.baohanh,
    this.size,
    this.regularPrice,
    this.salePrice,
    this.quantity,
  });

  Details copyWith({
    int? id,
    int? idOrder,
    int? idProduct,
    String? photo,
    String? photoColor,
    String? name,
    String? code,
    String? color,
    String? baohanh,
    String? size,
    int? regularPrice,
    int? salePrice,
    int? quantity,
  }) {
    return Details(
      id: id ?? this.id,
      idOrder: idOrder ?? this.idOrder,
      idProduct: idProduct ?? this.idProduct,
      photo: photo ?? this.photo,
      photoColor: photoColor ?? this.photoColor,
      name: name ?? this.name,
      code: code ?? this.code,
      color: color ?? this.color,
      baohanh: baohanh ?? this.baohanh,
      size: size ?? this.size,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
    );
  }

  Details.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idOrder = json['id_order'] as int?,
        idProduct = json['id_product'] as int?,
        photo = json['photo'] as String?,
        photoColor = json['photo_color'] as String?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        color = json['color'] as String?,
        baohanh = json['baohanh'] as String?,
        size = json['size'] as String?,
        regularPrice = json['regular_price'] as int?,
        salePrice = json['sale_price'] as int?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_order': idOrder,
        'id_product': idProduct,
        'photo': photo,
        'photo_color': photoColor,
        'name': name,
        'code': code,
        'color': color,
        'baohanh': baohanh,
        'size': size,
        'regular_price': regularPrice,
        'sale_price': salePrice,
        'quantity': quantity
      };
}
