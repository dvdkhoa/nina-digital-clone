import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';

import '../../../shared/extensions/string_ext.dart';
import '../../product_category/product_category_screen.dart';
import '../models/mock_model.dart';
import '../screens/category_screen.dart';
import 'section_layout_widget.dart';

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final asyncValue = ref.watch(productCategoryListProvider);

    return SectionLayoutWidget(
      title: 'Danh mục',
      child: SizedBox(
        height: 220,
        // width: 200,
        child: asyncValue.when(
          data: (data) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              crossAxisSpacing: 15,
              mainAxisSpacing: 5,
              children: data.map(
                (item) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed(ProductCategoryScreen.nameRoute,
                          queryParameters: {'title': item.namevi});
                    },
                    child: Container(
                      width: 100,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/swatch_cat.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            item.namevi.capitalize(),
                            style: defaultTextStyle.copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
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
      onButtonClick: () {
        context.goNamed(CategoryScreen.nameRoute);
      },
    );
  }
}
