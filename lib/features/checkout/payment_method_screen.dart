import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../home/home_screen.dart';
import '../payment/models/mock_model.dart';
import 'models/order_model.dart';
import 'providers/order_provider.dart';

class PaymentMethodScreen extends ConsumerWidget {
  final OrderModel order;
  const PaymentMethodScreen({Key? key, required this.order}) : super(key: key);

  static const String nameRoute = 'payment-method';
  static const String pathRoute = 'payment-method';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phương thức thanh toán'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chọn phương thức thanh toán bạn muốn sử dụng',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Column(
                children: payment_methods
                    .map((method) => _PaymentMethodItem(
                          title: method['title'].toString(),
                          image: method['image'].toString(),
                          isChecked: (method['isChecked'] != null) ??
                              method['isChecked'] as bool,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          child: Text(
            'Xác nhận thanh toán',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            ref.read(asyncOrderNotifierProvider.notifier).createOrder(order);
            showDialog(
              context: context,
              builder: (context) {
                return CustomDialogWidget();
              },
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(14, 30, 37, 0.12),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  2,
                ),
              ),
              BoxShadow(
                color: Color.fromRGBO(14, 30, 37, 0.32),
                blurRadius: 16,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  2,
                ),
              ),
            ]),
      ),
    );
  }
}

class _PaymentMethodItem extends StatelessWidget {
  final String title;
  final String image;
  final bool isChecked;
  const _PaymentMethodItem(
      {Key? key,
      required this.title,
      required this.image,
      this.isChecked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset('assets/images/${image}'),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Text(
          title,
          style: defaultTextStyle.copyWith(fontSize: 13),
        )),
        Icon(
          isChecked ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: Color(0xff0A70B8),
        )
      ]),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 2.6,
              spreadRadius: 0,
              offset: Offset(
                1.95,
                1.95,
              ),
            ),
          ]),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/img-success.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Đặt hàng thành công',
              style: defaultTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              'Chúc mừng bạn đã đặt hàng thành công',
              style: defaultTextStyle.copyWith(
                  fontSize: 12, color: Color(0xff5B5B5B)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Xem đơn hàng',
                  style: defaultTextStyle.copyWith(
                      fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0A70B8),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(HomeScreen.nameRoute);
                },
                child: Text(
                  'Trang chủ',
                  style: defaultTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE7E7E7),
                    padding: EdgeInsets.symmetric(vertical: 12)),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
