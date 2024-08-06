import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/search_provider.dart';
import 'product_list_result_widget.dart';

class SearchResultWidget extends ConsumerWidget {
  final String keyword;
  const SearchResultWidget({Key? key, required this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchNotifierProvider);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (searchProvider.isLoading) ...[
            Center(
              child: CircularProgressIndicator(),
            )
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kết quả tìm kiếm $keyword'),
                Text('${searchProvider.products?.length} sản phẩm'),
              ],
            ),
            searchProvider.products!.length > 0
                ? ProductListResultWidget(
                    products: searchProvider.products ?? [])
                : _emptyResultWidget()
          ],
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
