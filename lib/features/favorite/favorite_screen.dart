import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nina_digital/features/home/models/product_model.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';
import 'package:nina_digital/features/home/providers/product_provider.dart';
import 'package:nina_digital/features/home/widgets/category_list_filter_widget.dart';

import '../../shared/common_widgets/product_list_widget.dart';
import '../home/models/mock_model.dart';
import '../home/widgets/popular_products_widget.dart';
import 'providers/favorite_product_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  static const String nameRoute = 'favorite';
  static const String pathRoute = '/favorite';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue asyncProductListsValue = ref.watch(productCategoryListProvider);
    final asyncFavoriteProductsValue = ref.watch(asyncFavoriteProductProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child: Image.asset('assets/images/g22.png')),
        title: Text('Danh sách yêu thích'),
        actions: [
          IconButton(
              onPressed: () {
                print('search');
              },
              icon: SvgPicture.asset('assets/icons/search.svg'))
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
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              asyncFavoriteProductsValue.when(
                  loading: () => CircularProgressIndicator(),
                  data: (data) {
                    return ProductListWidget(products: data);
                  },
                  error: (Object error, StackTrace stackTrace) =>
                      Text(error.toString() + stackTrace.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
