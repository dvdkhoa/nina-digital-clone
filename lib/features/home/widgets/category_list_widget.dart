import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/product_category.dart';

import '../../../shared/constants/api_url.dart';
import '../../../shared/extensions/string_ext.dart';
import '../../search/providers/filter_provider.dart';
import '../../search/providers/search_provider.dart';
import '../../search/search_screen.dart';
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
                      ref
                          .read(filterNotifierProvider.notifier)
                          .changeProLists(item.id);
                      ref
                          .read(searchNotifierProvider.notifier)
                          .filterProducts();
                      context.pushNamed(SearchScreen.nameRoute, queryParameters: { 'id_list': item.id.toString() });
                    },
                    child: Container(
                      width: 100,
                      child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.lightBlueAccent.shade100,
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${ApiUrl.resourcesURL}/upload/product/${item.icon}',
                                placeholder: (context, url) => Image.asset(
                                    'assets/images/placeholder.jpg'),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/error.png'),
                                fit: BoxFit.scaleDown,
                                width: 80,
                                height: 80,
                              ),
                            ),
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
            child: SpinKitCircle(
              size: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
      onButtonClick: () {
        context.goNamed(CategoryScreen.nameRoute);
      },
    );
  }
}
