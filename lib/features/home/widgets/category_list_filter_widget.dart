import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/models/product_list_model.dart';

import '../../../shared/extensions/string_ext.dart';
import '../../search/providers/filter_provider.dart';
import '../../search/providers/search_provider.dart';
import '../../search/search_screen.dart';

class CategoryListFilterWidget extends ConsumerWidget {
  List<ProductListModel> list;

  CategoryListFilterWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {

              ref.read(filterNotifierProvider.notifier).changeProLists(list[index].id);

              ref.read(searchNotifierProvider.notifier).filterProducts();

              context.pushNamed(SearchScreen.nameRoute, queryParameters: { 'id_list': list[index].id.toString() } );
            },
            child: Chip(
              label: Text(
                list[index].namevi.capitalize(),
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black, fontSize: 13),
              ),
              // selected: false,   selectedColor: Color(0xff0A70B8),
              // showCheckmark: false,

              side: const BorderSide(
                color: Colors.black,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}
