import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';

import '../../../shared/extensions/string_ext.dart';
import '../../product/product_detail_screen.dart';
import '../../product_category/product_category_screen.dart';
import '../models/mock_model.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'categies';
  static const String pathRoute = 'categies';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final asyncValue = ref.watch(productCategoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh mục',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        // margin: EdgeInsets.symmetric(vertical: 20),
        child: asyncValue.when(
          data: (data) {
            return AlignedGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(ProductCategoryScreen.nameRoute,
                        queryParameters: {
                          'title': data[index].namevi.capitalize()
                        });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/swatch_cat.png',
                            height: 80, width: 80),
                        Text(data[index].namevi.capitalize()),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString() + stackTrace.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
