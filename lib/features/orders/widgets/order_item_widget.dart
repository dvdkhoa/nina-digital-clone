import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../order_detail_screen.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return GestureDetector(
      onTap: () {
        context.pushNamed(OrderDetailScreen.nameRoute,
            pathParameters: {'id': 'mock-id'});
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Đang vận chuyển',
                    style: defaultTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffE7E7E7),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Text(
                  '20-07-2024 10h50',
                  style: defaultTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            Divider(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/iphone.png',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Iphone 14 Pro Max',
                        style: defaultTextStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Màu sắc: Gold',
                            style: defaultTextStyle.copyWith(
                              fontSize: 12,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                          Text(
                            'Số lượng: 2',
                            style: defaultTextStyle.copyWith(
                              fontSize: 12,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '58.780.000đ',
                            style: defaultTextStyle.copyWith(
                                fontSize: 13, color: Color(0xffE82727)),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Track order',
                              style: defaultTextStyle.copyWith(
                                  fontSize: 12, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0A70B8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 12)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
