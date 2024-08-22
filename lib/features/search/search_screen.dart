import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/extensions/string_ext.dart';
import '../../shared/utils/helper.dart';
import 'providers/filter_provider.dart';
import 'providers/search_provider.dart';
import 'widgets/old_search_list_widget.dart';
import 'widgets/orderby_widget.dart';
import 'widgets/procat_widget.dart';
import 'widgets/prolist_widget.dart';
import 'widgets/search_result_widget.dart';

part 'widgets/filter_modal_widget.dart';
part 'widgets/result_section_widget.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final int? idList;
  const SearchScreen({Key? key, this.idList}) : super(key: key);

  static const String nameRoute = 'search';
  static const String pathRoute = '/search';

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  bool isFilter = false;
  final searchController = TextEditingController();

  void setFilter(bool value) {
    setState(() {
      isFilter = value;
    });
  }

  @override
  void initState() {
    if(widget.idList != null) {
      isFilter = true;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print('rebuild search');
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
                onChanged: (value) {
                  ref.read(filterNotifierProvider.notifier).changeSearchKeyWord(value);
                },
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.grey.shade500),
                      onPressed: () {
                        _onSubmit();
                      },
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.tune),
                      onTap: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          showDragHandle: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: FilterModelBottomSheet(
                                onFilter: () {
                                  setFilter(true);
                                },
                                onReset: () {
                                  setFilter(false);
                                  ref
                                      .read(filterNotifierProvider.notifier)
                                      .reset();
                                 searchController.text = '';
                                },
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
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Hôm nay',
              //       style: TextStyle(fontSize: 15),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         print('Xóa');
              //         // ref.read(filterNotifierProvider.notifier).changeSearchKeyWord(null);
              //         // setState(() {});
              //       },
              //       child: Text(
              //         'Xóa tất cả',
              //         style: TextStyle(fontSize: 13),
              //       ),
              //     ),
              //   ],
              // ),
              // Divider(
              //   height: 15,
              // ),
              ResultSectionWidget(isFilter: isFilter,)
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    final keyword = ref.read(filterNotifierProvider.select((value)=>value.keyword));
    await ref
        .read(searchNotifierProvider.notifier)
        .searchProducts(keyword);
    setState(() {
    });
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
