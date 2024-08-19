
import '../../../shared/utils/helper.dart';

enum OrderBy {
  New,
  LowToHighPrice,
  HighToLowPrice
}


class FilterState {
  List<int>? id_lists = [];
  List<int>? id_cats = [];
  List<int>? id_items = [];
  List<int>? id_subs = [];
  bool hot;
  String? keyword;
  double? basePrice;
  double? upPrice;
  OrderBy orderBy;

  FilterState({ this.id_lists, this.id_cats, this.id_items, this.id_subs, this.hot = true, this.basePrice, this.upPrice, this.keyword, this.orderBy = OrderBy.New });


  FilterState copyWith({ List<int>? id_lists, List<int>? id_cats, List<int>? id_items, List<int>? id_subs, hot, basePrice, upPrice, keyword, orderBy }){
    return FilterState(
      id_lists: id_lists ?? this.id_lists,
      id_cats: id_cats ?? this.id_cats,
      id_items: id_items ?? this.id_items,
      id_subs: id_subs ?? this.id_subs,
      hot: hot ?? this.hot,
      keyword: keyword ?? this.keyword,
      basePrice: basePrice ?? this.basePrice,
      upPrice: upPrice ?? this.upPrice,
      orderBy: orderBy ?? this.orderBy
    );
  }

  Map<String, dynamic> toJson()  {
    Map<String,dynamic> json = new Map();

    if(!Helper.isNull(this.keyword)) {
      json['keyword'] = this.keyword;
    }
    if(!Helper.isNull(this.id_lists) && (id_lists?.length ?? 0 ) > 0 && (id_lists?[0] ?? 0) > 0 ) {
      json['id_lists'] = this.id_lists?.join(',');
    }
    if(!Helper.isNull(this.id_cats) && (id_cats?.length ?? 0 ) > 0 ) {
      json['id_cats'] = this.id_cats?.join(',');
    }
    if(!Helper.isNull(this.id_items) && (id_items?.length ?? 0 ) > 0 ) {
      json['id_items'] = this.id_items?.join(',');
    }
    if(!Helper.isNull(this.id_subs) && (id_subs?.length ?? 0 ) > 0 ) {
      json['id_subs'] = this.id_subs?.join(',');
    }
    if(hot) {
      json['hot'] = 1;
    }
    if(!Helper.isNull(this.basePrice)) {
      json['base_price'] = this.basePrice;
    }
    if(!Helper.isNull(this.upPrice)) {
      json['up_price'] = this.upPrice;
    }
    int orderByasInt = this.orderBy.index;
    if(orderByasInt > 0) {
      json['order_by'] = orderByasInt;
    }

    return json;
  }
}