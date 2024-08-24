import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/utils/helper.dart';
import 'category_provider.dart';
import 'filter_state.dart';

part 'filter_provider.g.dart';

@Riverpod(keepAlive: false)
class FilterNotifier extends _$FilterNotifier {
  @override
  FilterState build() {
    return FilterState(id_lists: [0], id_cats: [], id_subs: [], id_items: []);
  }

  void changeProLists(int id_list) {
    // final isExists = state.id_lists?.contains(id_list) ?? false;
    // final list = state.id_lists?.toList();
    // if(isExists) {
    //   list?.remove(id_list);
    // }
    // else {
    //   list?.add(id_list);
    // }
    // state = state.copyWith(id_lists: list);

    state.id_cats = [];
    if(id_list == state.id_lists?[0]) {
      state = state.copyWith(id_lists: [0]);
    }
    else {
      state = state.copyWith(id_lists: [id_list]);
    }
    ref.read(categoryProviderProvider(level: 2, id_parent: id_list).notifier).fetchCategory(2, state.id_lists?[0]);
  }

  void changeProCats(int id_cat) {
    final cat_list = state.id_cats;
    if(cat_list!.length > 0) {
      if(id_cat == state.id_cats?[0]) {
        state = state.copyWith(id_cats: []);
        return;
      }
    }
      state = state.copyWith(id_cats: [id_cat]);
  }

  void changeOrderBy(OrderBy orderBy) {
    state = state.copyWith(orderBy: orderBy);
  }

  void onChangeUpPrice(String value) {
    if(!Helper.isNull(value)) {
      state = state.copyWith(upPrice: int.parse(value));
    } else{
      state = state.copyWith(upPrice: null);
    }
  }
  void onChangeBasePrice(String value) {
    if(!Helper.isNull(value)) {
      state = state.copyWith(basePrice: int.parse(value));
    } else{
      state = state.copyWith(basePrice: null);
    }
  }

  void changeSearchKeyWord(String? value) {
    state = state.copyWith(keyword: value);
  }

  void reset() {
    state = FilterState(id_lists: [0], id_cats: [], id_subs: [], id_items: []);
  }
}
