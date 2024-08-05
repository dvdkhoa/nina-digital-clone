import 'package:flutter/material.dart';
import 'orders_by_type_widget.dart';

class OrderingTabWidget extends StatelessWidget {
  const OrderingTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderByTypeWidget(
      orders: [],
    );
  }
}
