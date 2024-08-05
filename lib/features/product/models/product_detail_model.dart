class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.idList,
    required this.idItem,
    required this.idCat,
    required this.idSub,
    required this.idBrand,
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
    required this.code,
    required this.regularPrice,
    required this.discount,
    required this.salePrice,
    required this.numb,
    required this.status,
    required this.type,
    required this.dateCreated,
    required this.dateUpdated,
    required this.view,
    required this.icon,
    required this.thuoctinh,
    required this.gallery,
  });
  late final int id;
  late final int idList;
  late final int idItem;
  late final int idCat;
  late final int idSub;
  late final int idBrand;
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
  late final String code;
  late final double regularPrice;
  late final int discount;
  late final double salePrice;
  late final int numb;
  late final String status;
  late final String type;
  late final int dateCreated;
  late final int dateUpdated;
  late final int view;
  late final String icon;
  late final List<Thuoctinh> thuoctinh;
  late final List<Gallery> gallery;

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idList = json['id_list'];
    idItem = json['id_item'];
    idCat = json['id_cat'];
    idSub = json['id_sub'];
    idBrand = json['id_brand'];
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
    code = json['code'];
    regularPrice = double.parse(json['regular_price'].toString());
    discount = json['discount'];
    salePrice = double.parse(json['sale_price'].toString());
    numb = json['numb'];
    status = json['status'];
    type = json['type'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    view = json['view'];
    icon = json['icon'];
    thuoctinh =
        List.from(json['thuoctinh']).map((e) => Thuoctinh.fromJson(e)).toList();
    gallery =
        List.from(json['gallery']).map((e) => Gallery.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_list'] = idList;
    _data['id_item'] = idItem;
    _data['id_cat'] = idCat;
    _data['id_sub'] = idSub;
    _data['id_brand'] = idBrand;
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
    _data['code'] = code;
    _data['regular_price'] = regularPrice;
    _data['discount'] = discount;
    _data['sale_price'] = salePrice;
    _data['numb'] = numb;
    _data['status'] = status;
    _data['type'] = type;
    _data['date_created'] = dateCreated;
    _data['date_updated'] = dateUpdated;
    _data['view'] = view;
    _data['icon'] = icon;
    _data['thuoctinh'] = thuoctinh.map((e) => e.toJson()).toList();
    _data['gallery'] = gallery.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Thuoctinh {
  Thuoctinh({
    required this.size,
    required this.color,
    required this.baohanh,
    required this.regularPrice,
    required this.salePrice,
  });
  late final String size;
  late final String color;
  late final String baohanh;
  late final double regularPrice;
  late final double salePrice;

  Thuoctinh.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    color = json['color'];
    baohanh = json['baohanh'];
    regularPrice = double.parse(json['regular_price'].toString());
    salePrice = double.parse(json['sale_price'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['size'] = size;
    _data['color'] = color;
    _data['baohanh'] = baohanh;
    _data['regular_price'] = regularPrice;
    _data['sale_price'] = salePrice;
    return _data;
  }
}

class Gallery {
  Gallery({
    required this.id,
    required this.photo,
    required this.namevi,
    required this.nameen,
    required this.idColor,
    required this.numb,
  });
  late final int id;
  late final String photo;
  late final String namevi;
  late final String nameen;
  late final int idColor;
  late final int numb;

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    namevi = json['namevi'];
    nameen = json['nameen'];
    idColor = json['id_color'];
    numb = json['numb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['photo'] = photo;
    _data['namevi'] = namevi;
    _data['nameen'] = nameen;
    _data['id_color'] = idColor;
    _data['numb'] = numb;
    return _data;
  }
}
