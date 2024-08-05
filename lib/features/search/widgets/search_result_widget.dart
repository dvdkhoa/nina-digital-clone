import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_list_result_widget.dart';

class SearchResultWidget extends StatelessWidget {
  final String keyword;
  final List<ProductModel> results;
  const SearchResultWidget(
      {Key? key, required this.keyword, required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kết quả tìm kiếm $keyword'),
              Text('${results.length} sản phẩm'),
            ],
          ),
          results.length > 0
              ? ProductListResultWidget(products: results)
              : _emptyResultWidget()
        ],
      ),
    );
  }
}

Widget _emptyResultWidget() {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Image.asset('assets/images/order.png'),
        SizedBox(
          height: 40,
        ),
        Text('Không tìm thấy'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Xin lỗi, không tìm thấy từ khóa bạn đã nhập, vui lòng kiểm tra lại hoặc tìm kiếm bằng từ khác',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 80,
        )
      ],
    ),
  );
}
