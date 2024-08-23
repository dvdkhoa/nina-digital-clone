import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';

import '../../../shared/common_widgets/product_list_widget.dart';
import '../providers/product_homepage_provider.dart';
import '../screens/popular_screen.dart';
import 'category_list_filter_widget.dart';
import 'section_layout_widget.dart';

class PopularProductsWidget extends ConsumerWidget {
  const  PopularProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducHomePagetValue = ref.watch(asyncProductHomePageProvider);
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
            loading: () => const Center(
              child: SpinKitCircle(size: 20, color: Colors.red,),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          asyncProducHomePagetValue.when(
              loading: () => CircularProgressIndicator(),
              data: (data) {
                return ProductListWidget(products: data);
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
