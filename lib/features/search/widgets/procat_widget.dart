import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nina_digital/shared/common_widgets/list_filter_widget.dart';

import '../providers/category_provider.dart';
import '../providers/filter_provider.dart';

class ProcatWidget extends ConsumerWidget {
  const ProcatWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selected_id_lists = ref.watch(filterNotifierProvider.select((value)=>value.id_lists?[0]));

    final asyncCatProvider = ref.watch(categoryProviderProvider(level: 2, id_parent: selected_id_lists ?? 0));

    final selectedIds = ref.watch(filterNotifierProvider.select((value) => value.id_cats));


    return asyncCatProvider.when(
      data: (data){
        return ListFilterWidget(
          list: data,
          selectedIds: selectedIds ?? [],
          onChange: (int id_cat) {
            ref.read(filterNotifierProvider.notifier).changeProCats(id_cat);
          },
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString()),),
      loading: () => const Center(child: SpinKitFadingCube(
        color: Colors.white,
        size: 30.0,
      ),),);
  }
}
