import 'package:flutter/material.dart';

class ProductOrderItemWidget extends StatelessWidget {
  const ProductOrderItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '58.780.000đ',
                      style: defaultTextStyle.copyWith(
                          fontSize: 13, color: Color(0xffE82727)),
                    ),
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
        // borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
