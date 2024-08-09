import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';
import 'package:nina_digital/features/home/providers/product_provider.dart';
import 'package:nina_digital/shared/providers/models/product_model.dart';

import '../../../shared/common_widgets/product_list_widget.dart';
import '../models/mock_model.dart';
import '../screens/popular_screen.dart';
import 'category_list_filter_widget.dart';
import 'category_list_widget.dart';
import 'section_layout_widget.dart';

class PopularProductsWidget extends ConsumerWidget {
  const PopularProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProductValue = ref.watch(asyncProductNotifierProvider);
    AsyncValue asyncProductListsValue = ref.watch(productCategoryListProvider);

    return SectionLayoutWidget(
      title: 'Sản phẩm phổ biến',
      child: Column(
        children: [
          asyncProductListsValue.when(
            data: (data) {
              return CategoryListFilterWidget(
                list: data,
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          asyncProductValue.when(
              loading: () => CircularProgressIndicator(),
              data: (data) {
                return ProductListWidget(products: data.products ?? []);
              },
              error: (Object error, StackTrace stackTrace) =>
                  Text(error.toString())),
        ],
      ),
      onButtonClick: () {
        context.goNamed(PopularScreen.nameRoute);
      },
    );
  }
}
