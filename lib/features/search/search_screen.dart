import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/search/models/product_model.dart';
import 'package:nina_digital/features/home/widgets/category_list_filter_widget.dart';
import 'package:nina_digital/shared/common_widgets/list_filter_widget.dart';

import 'models/mock_model.dart';
import 'providers/search_provider.dart';
import 'widgets/old_search_list_widget.dart';
import 'widgets/search_result_widget.dart';

part 'widgets/filter_modal_widget.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'search';
  static const String pathRoute = '/search';

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String _searchKey = '';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onSubmitted: (value) async {
                  await ref
                      .read(searchNotifierProvider.notifier)
                      .searchProducts(value);
                  setState(() {
                    _searchKey = value;
                  });
                },
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.tune),
                      onTap: () {
                        _showFilterModal(context, defaultTextStyle);
                      },
                    ),
                    hintText: 'Nhập nội dung tìm kiếm',
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: _enableBorder,
                    focusedBorder: _focusBorder),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hôm nay',
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      searchController.text = '';
                      setState(() {
                        _searchKey = '';
                      });
                    },
                    child: Text(
                      'Xóa tất cả',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15,
              ),
              _searchKey.isEmpty
                  ? OldSearchListWidget()
                  : SearchResultWidget(
                      keyword: _searchKey,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

InputBorder _enableBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(20),
);

InputBorder _focusBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
  borderRadius: BorderRadius.circular(20),
);

InputBorder _enableBorderInputPrice = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(10),
);

InputDecoration _priceInputDecoration(title) => InputDecoration(
    filled: true,
    fillColor: Color(0xffF5F5F5),
    hintText: title,
    hintStyle: TextStyle(fontSize: 14),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none));
