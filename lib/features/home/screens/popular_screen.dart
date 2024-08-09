import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:nina_digital/features/home/providers/product_category.dart';
import 'package:nina_digital/shared/providers/models/product_model.dart';

import '../../../shared/common_widgets/product_list_widget.dart';
import '../../search/search_screen.dart';
import '../providers/product_provider.dart';
import '../widgets/category_list_filter_widget.dart';

class PopularScreen extends ConsumerStatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'popular';
  static const String pathRoute = 'popular';

  @override
  ConsumerState<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends ConsumerState<PopularScreen> {
  final scrollController = ScrollController();
  bool _isLoading = true;

  @override
  void initState() {
    scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));
      await ref.read(asyncProductNotifierProvider.notifier).loadMoreProduct();

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncProductValue = ref.watch(asyncProductNotifierProvider);
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
        controller: scrollController,
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
              asyncProductValue.when(
                  loading: () => CircularProgressIndicator(),
                  data: (data) {
                    return ProductListWidget(products: data.products ?? []);
                  },
                  error: (Object error, StackTrace stackTrace) =>
                      Text(error.toString())),
              SizedBox(
                height: 10,
              ),
              // SpinKitWave(
              //   color: Colors.red,
              //   // size: 50.0,
              // )
              _isLoading
                  ? SpinKitWave(
                      color: Colors.lightBlueAccent.shade200,
                      size: 20.0,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
