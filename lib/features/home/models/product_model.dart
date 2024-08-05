class ProductModel {
  final int? id;
  final int? idList;
  final int? idItem;
  final int? idCat;
  final int? idSub;
  final int? idBrand;
  final String? photo;
  final String? options;
  final String? slugvi;
  final String? slugen;
  final String? contenten;
  final String? contentvi;
  final String? descen;
  final String? descvi;
  final String? nameen;
  final String? namevi;
  final String? code;
  final double? regularPrice;
  final int? discount;
  final double? salePrice;
  final int? numb;
  final String? status;
  final String? type;
  final int? dateCreated;
  final int? dateUpdated;
  final int? view;
  final String? icon;

  ProductModel({
    this.id,
    this.idList,
    this.idItem,
    this.idCat,
    this.idSub,
    this.idBrand,
    this.photo,
    this.options,
    this.slugvi,
    this.slugen,
    this.contenten,
    this.contentvi,
    this.descen,
    this.descvi,
    this.nameen,
    this.namevi,
    this.code,
    this.regularPrice,
    this.discount,
    this.salePrice,
    this.numb,
    this.status,
    this.type,
    this.dateCreated,
    this.dateUpdated,
    this.view,
    this.icon,
  });

  ProductModel copyWith({
    int? id,
    int? idList,
    int? idItem,
    int? idCat,
    int? idSub,
    int? idBrand,
    String? photo,
    String? options,
    String? slugvi,
    String? slugen,
    String? contenten,
    String? contentvi,
    String? descen,
    String? descvi,
    String? nameen,
    String? namevi,
    String? code,
    double? regularPrice,
    int? discount,
    double? salePrice,
    int? numb,
    String? status,
    String? type,
    int? dateCreated,
    int? dateUpdated,
    int? view,
    String? icon,
  }) {
    return ProductModel(
      id: id ?? this.id,
      idList: idList ?? this.idList,
      idItem: idItem ?? this.idItem,
      idCat: idCat ?? this.idCat,
      idSub: idSub ?? this.idSub,
      idBrand: idBrand ?? this.idBrand,
      photo: photo ?? this.photo,
      options: options ?? this.options,
      slugvi: slugvi ?? this.slugvi,
      slugen: slugen ?? this.slugen,
      contenten: contenten ?? this.contenten,
      contentvi: contentvi ?? this.contentvi,
      descen: descen ?? this.descen,
      descvi: descvi ?? this.descvi,
      nameen: nameen ?? this.nameen,
      namevi: namevi ?? this.namevi,
      code: code ?? this.code,
      regularPrice: regularPrice ?? this.regularPrice,
      discount: discount ?? this.discount,
      salePrice: salePrice ?? this.salePrice,
      numb: numb ?? this.numb,
      status: status ?? this.status,
      type: type ?? this.type,
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      view: view ?? this.view,
      icon: icon ?? this.icon,
    );
  }

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idList = json['id_list'] as int?,
        idItem = json['id_item'] as int?,
        idCat = json['id_cat'] as int?,
        idSub = json['id_sub'] as int?,
        idBrand = json['id_brand'] as int?,
        photo = json['photo'] as String?,
        options = json['options'] as String?,
        slugvi = json['slugvi'] as String?,
        slugen = json['slugen'] as String?,
        contenten = json['contenten'] as String?,
        contentvi = json['contentvi'] as String?,
        descen = json['descen'] as String?,
        descvi = json['descvi'] as String?,
        nameen = json['nameen'] as String?,
        namevi = json['namevi'] as String?,
        code = json['code'] as String?,
        regularPrice = double.parse(json['regular_price'].toString()),
        discount = json['discount'] as int?,
        salePrice = double.parse(json['sale_price'].toString()),
        numb = json['numb'] as int?,
        status = json['status'] as String?,
        type = json['type'] as String?,
        dateCreated = json['date_created'] as int?,
        dateUpdated = json['date_updated'] as int?,
        view = json['view'] as int?,
        icon = json['icon'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_list': idList,
        'id_item': idItem,
        'id_cat': idCat,
        'id_sub': idSub,
        'id_brand': idBrand,
        'photo': photo,
        'options': options,
        'slugvi': slugvi,
        'slugen': slugen,
        'contenten': contenten,
        'contentvi': contentvi,
        'descen': descen,
        'descvi': descvi,
        'nameen': nameen,
        'namevi': namevi,
        'code': code,
        'regular_price': regularPrice,
        'discount': discount,
        'sale_price': salePrice,
        'numb': numb,
        'status': status,
        'type': type,
        'date_created': dateCreated,
        'date_updated': dateUpdated,
        'view': view,
        'icon': icon
      };
}
