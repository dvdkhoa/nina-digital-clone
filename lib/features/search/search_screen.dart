import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/search/models/product_model.dart';
import 'package:nina_digital/features/home/widgets/category_list_filter_widget.dart';
import 'package:nina_digital/shared/common_widgets/list_filter_widget.dart';

import 'models/mock_model.dart';
import 'widgets/old_search_list_widget.dart';
import 'widgets/search_result_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'search';
  static const String pathRoute = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchKey = '';
  List<ProductModel> _results = [];

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
                onSubmitted: (value) {
                  setState(() {
                    _searchKey = value;
                    if (_searchKey == 'iphone') {
                      _results = products;
                    } else {
                      _results = [];
                    }
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
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Bộ lọc',
                                      style: defaultTextStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Text('Danh mục'),
                                  ListFilterWidget(
                                    list: categories,
                                    multipleSelect: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Hãng'),
                                  ListFilterWidget(
                                    list: brands,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Khoảng giá'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: defaultTextStyle.copyWith(
                                              fontSize: 14),
                                          decoration:
                                              _priceInputDecoration('Từ'),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text('-'),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          style: defaultTextStyle.copyWith(
                                              fontSize: 14),
                                          decoration:
                                              _priceInputDecoration('Đến'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Sắp xếp theo'),
                                  ListFilterWidget(
                                    list: orderBy,
                                    multipleSelect: false,
                                  ),
                                  /* -------------- */
                                  Divider(
                                    height: 15,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: Text(
                                              'Reset',
                                              style: defaultTextStyle.copyWith(
                                                  fontSize: 15),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE7E7E7),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 14),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print('Filter...');
                                              context.pop();
                                            },
                                            child: Text(
                                              'Lọc',
                                              style: defaultTextStyle.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff0A70B8),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
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
                      print('Xóa tất cả');
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
                  : SearchResultWidget(keyword: _searchKey, results: _results),
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
