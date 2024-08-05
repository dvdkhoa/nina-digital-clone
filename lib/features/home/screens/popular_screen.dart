import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';
import 'package:nina_digital/shared/providers/models/product_model.dart';

import '../../../shared/common_widgets/list_filter_widget.dart';
import '../../../shared/common_widgets/product_list_widget.dart';
import '../../search/search_screen.dart';
import '../models/mock_model.dart';
import '../providers/product_provider.dart';
import '../widgets/category_list_filter_widget.dart';
import '../widgets/category_list_widget.dart';
import '../widgets/popular_products_widget.dart';

class PopularScreen extends ConsumerWidget {
  const PopularScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'popular';
  static const String pathRoute = 'popular';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue asyncProductsValue = ref.watch(productListProvider);
    AsyncValue asyncProductListsValue = ref.watch(productCategoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Phổ biến'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(SearchScreen.nameRoute);
              },
              icon: SvgPicture.asset('assets/icons/search.svg')),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              asyncProductsValue.when(
                  loading: () => CircularProgressIndicator(),
                  data: (res) {
                    final data = res['data'] as List;

                    List<ProductModel> productList = data
                        .map((item) => ProductModel.fromJson(item))
                        .toList();

                    return ProductListWidget(products: productList);
                  },
                  error: (Object error, StackTrace stackTrace) =>
                      Text(error.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
