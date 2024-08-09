import 'package:flutter/material.dart';
import '../../checkout/models/order_model.dart';
import 'order_item_widget.dart';

class OrderByTypeWidget extends StatelessWidget {
  final List<OrderModel> orders;
  const OrderByTypeWidget({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    if (orders!.isEmpty) {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Image.asset('assets/images/order.png'),
            Text('Bạn chưa có đơn hàng',
                style: defaultTextStyle.copyWith(fontSize: 20)),
            Text(
              'Bạn chưa có đơn hàng nào đang đặt trong thời gian này',
              style: defaultTextStyle.copyWith(fontSize: 13),   
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: orders.map((order) => OrderItemWidget()).toList(),
        ),
      ),
    );
  }
}
