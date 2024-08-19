
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/shared/common_widgets/list_filter_widget.dart';

import '../../../shared/utils/helper.dart';
import '../models/category_model.dart';
import '../providers/category_provider.dart';
import '../providers/filter_provider.dart';

class ProlistWidget extends ConsumerWidget {
  const ProlistWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print('rebuild prolist');

    final asyncCategoriesValue = ref.watch(categoryProviderProvider(level: 1));

    final selectedIds = ref.watch(filterNotifierProvider.select((value) => value.id_lists));

    return asyncCategoriesValue.when(data: (data){
      // final firstItem = data.firstWhere((item)=>item.id == 0);
      // if(Helper.isNull(firstItem)) {
      //   data.insert(0, CategoryModel(id: 0, namevi: 'Tất cả'));
      // }
      return ListFilterWidget(
        list: data,
        selectedIds: selectedIds ?? [],
        onChange: (int id_list) {
          ref.read(filterNotifierProvider.notifier).changeProLists(id_list);
        },
      );
    },
      error: (error, stackTrace) => Center(child: Text(error.toString()),),
      loading: () => const Center(child: CircularProgressIndicator(),),);
  }
}

