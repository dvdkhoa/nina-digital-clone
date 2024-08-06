import 'package:flutter/material.dart';

import 'search_item_widget.dart';

class OldSearchListWidget extends StatelessWidget {
  const OldSearchListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:
            _oldSearchs.map((item) => SearchItemWidget(title: item)).toList(),
      ),
    );
  }
}

final _oldSearchs = [
  'Iphone 14 Pro Max',
  'Đồng hồ Kieslect Mart',
  'Smart Tivi Xiaomi',
  'Máy lọc không khí LG',
  'Màn hình PC',
  'Tai nghe Bluetooth',
  'Camera',
  'Điện thoại'
];
