import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/mock_model.dart';
import '../providers/filter_provider.dart';
import '../providers/filter_state.dart';


class OrderbyWidget extends ConsumerWidget {

  const OrderbyWidget(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedItem = ref.watch(filterNotifierProvider.select((value) => value.orderBy));

    final orderBy = OrderBy.values;

    final orderByLabel = orderBy.map((e) {
      switch(e.index){
        case 0:
          return 'Mới nhất';
        case 1:
          return 'Giá thấp tới cao';
        case 2:
          return 'Giá cao tới thấp';
      }
    }).toList();

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = orderBy[index] == selectedItem;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: FilterChip(
              label: Text(
                orderByLabel[index].toString(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 13),
              ),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: Color(0xff0A70B8),
              side: isSelected
                  ? BorderSide.none
                  : const BorderSide(
                color: Colors.black,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              onSelected: (bool value) {
                ref.read(filterNotifierProvider.notifier).changeOrderBy(orderBy[index]);
              },
            ),
          );
        },
        itemCount: orderBy.length,
      ),
    );
  }
}
