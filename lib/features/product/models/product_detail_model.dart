class ProductDetailModelGallery {
  int? id;
  String? photo;
  String? namevi;
  String? nameen;
  int? idColor;
  int? numb;

  ProductDetailModelGallery({
    this.id,
    this.photo,
    this.namevi,
    this.nameen,
    this.idColor,
    this.numb,
  });
  ProductDetailModelGallery.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    photo = json['photo']?.toString();
    namevi = json['namevi']?.toString();
    nameen = json['nameen']?.toString();
    idColor = int.tryParse(json['id_color']?.toString() ?? '');
    numb = int.tryParse(json['numb']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['namevi'] = namevi;
    data['nameen'] = nameen;
    data['id_color'] = idColor;
    data['numb'] = numb;
    return data;
  }
}

class ProductDetailModelThuoctinh {
  int? idSize;
  String? size;
  int? idColor;
  String? color;
  String? idBaohanh;
  String? baohanh;
  int? regularPrice;
  int? salePrice;

  ProductDetailModelThuoctinh({
    this.idSize,
    this.size,
    this.idColor,
    this.color,
    this.idBaohanh,
    this.baohanh,
    this.regularPrice,
    this.salePrice,
  });
  ProductDetailModelThuoctinh.fromJson(Map<String, dynamic> json) {
    idSize = int.tryParse(json['id_size']?.toString() ?? '');
    size = json['size']?.toString();
    idColor = int.tryParse(json['id_color']?.toString() ?? '');
    color = json['color']?.toString();
    idBaohanh = json['id_baohanh']?.toString();
    baohanh = json['baohanh']?.toString();
    regularPrice = int.tryParse(json['regular_price']?.toString() ?? '');
    salePrice = int.tryParse(json['sale_price']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_size'] = idSize;
    data['size'] = size;
    data['id_color'] = idColor;
    data['color'] = color;
    data['id_baohanh'] = idBaohanh;
    data['baohanh'] = baohanh;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    return data;
  }
}

class ProductDetailModel {
  int? id;
  int? idList;
  int? idItem;
  int? idCat;
  int? idSub;
  int? idBrand;
  String? photo;
  String? options;
  String? slugvi;
  String? slugen;
  String? contenten;
  String? contentvi;
  String? descen;
  String? descvi;
  String? nameen;
  String? namevi;
  String? code;
  int? regularPrice;
  int? discount;
  int? salePrice;
  int? numb;
  String? status;
  String? type;
  int? dateCreated;
  int? dateUpdated;
  int? view;
  String? icon;
  List<ProductDetailModelThuoctinh?>? thuoctinh;
  List<ProductDetailModelGallery?>? gallery;

  ProductDetailModel({
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
    this.thuoctinh,
    this.gallery,
  });
  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    idList = int.tryParse(json['id_list']?.toString() ?? '');
    idItem = int.tryParse(json['id_item']?.toString() ?? '');
    idCat = int.tryParse(json['id_cat']?.toString() ?? '');
    idSub = int.tryParse(json['id_sub']?.toString() ?? '');
    idBrand = int.tryParse(json['id_brand']?.toString() ?? '');
    photo = json['photo']?.toString();
    options = json['options']?.toString();
    slugvi = json['slugvi']?.toString();
    slugen = json['slugen']?.toString();
    contenten = json['contenten']?.toString();
    contentvi = json['contentvi']?.toString();
    descen = json['descen']?.toString();
    descvi = json['descvi']?.toString();
    nameen = json['nameen']?.toString();
    namevi = json['namevi']?.toString();
    code = json['code']?.toString();
    regularPrice = int.tryParse(json['regular_price']?.toString() ?? '');
    discount = int.tryParse(json['discount']?.toString() ?? '');
    salePrice = int.tryParse(json['sale_price']?.toString() ?? '');
    numb = int.tryParse(json['numb']?.toString() ?? '');
    status = json['status']?.toString();
    type = json['type']?.toString();
    dateCreated = int.tryParse(json['date_created']?.toString() ?? '');
    dateUpdated = int.tryParse(json['date_updated']?.toString() ?? '');
    view = int.tryParse(json['view']?.toString() ?? '');
    icon = json['icon']?.toString();
    if (json['thuoctinh'] != null && (json['thuoctinh'] is List)) {
      final v = json['thuoctinh'];
      final arr0 = <ProductDetailModelThuoctinh>[];
      v.forEach((v) {
        arr0.add(ProductDetailModelThuoctinh.fromJson(v));
      });
      thuoctinh = arr0;
    }
    if (json['gallery'] != null && (json['gallery'] is List)) {
      final v = json['gallery'];
      final arr0 = <ProductDetailModelGallery>[];
      v.forEach((v) {
        arr0.add(ProductDetailModelGallery.fromJson(v));
      });
      gallery = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_list'] = idList;
    data['id_item'] = idItem;
    data['id_cat'] = idCat;
    data['id_sub'] = idSub;
    data['id_brand'] = idBrand;
    data['photo'] = photo;
    data['options'] = options;
    data['slugvi'] = slugvi;
    data['slugen'] = slugen;
    data['contenten'] = contenten;
    data['contentvi'] = contentvi;
    data['descen'] = descen;
    data['descvi'] = descvi;
    data['nameen'] = nameen;
    data['namevi'] = namevi;
    data['code'] = code;
    data['regular_price'] = regularPrice;
    data['discount'] = discount;
    data['sale_price'] = salePrice;
    data['numb'] = numb;
    data['status'] = status;
    data['type'] = type;
    data['date_created'] = dateCreated;
    data['date_updated'] = dateUpdated;
    data['view'] = view;
    data['icon'] = icon;
    if (thuoctinh != null) {
      final v = thuoctinh;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['thuoctinh'] = arr0;
    }
    if (gallery != null) {
      final v = gallery;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['gallery'] = arr0;
    }
    return data;
  }
}
