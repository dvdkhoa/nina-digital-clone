import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nina_digital/features/home/models/product_model.dart';
import 'package:nina_digital/features/home/providers/product_provider.dart';

import '../../shared/common_widgets/product_list_widget.dart';

part './models/mock_models.dart';

class ProductCategoryScreen extends ConsumerWidget {
  final String titleCategory;
  const ProductCategoryScreen({super.key, required this.titleCategory});

  static const String nameRoute = 'products-category';
  static const String pathRoute = '/products-category';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue asyncValue = ref.watch(productListProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(titleCategory),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search.svg'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                asyncValue.when(
                    loading: () => CircularProgressIndicator(),
                    data: (data) {
                      // return ProductListWidget(products: product);
                      return Text(data.toString());
                    },
                    error: (Object error, StackTrace stackTrace) =>
                        Text(error.toString())),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
