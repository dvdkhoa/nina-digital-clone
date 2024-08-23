import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';

import '../../shared/common_widgets/product_list_widget.dart';
import '../home/widgets/category_list_filter_widget.dart';
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // asyncProductListsValue.when(
              //   data: (data) {
              //     return CategoryListFilterWidget(
              //       list: data,
              //     );
              //   },
              //   loading: () => Center(
              //     child: SpinKitCircle(size: 20, color: Colors.red,),
              //   ),
              //   error: (error, stackTrace) => Center(
              //     child: Text(error.toString()),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              asyncFavoriteProductsValue.when(
                  loading: () => SpinKitCircle(
                        size: 20,
                        color: Colors.red,
                      ),
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
