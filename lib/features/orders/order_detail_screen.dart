import 'package:flutter/material.dart';

import '../checkout/widgets/product_item_widget.dart';
import 'widgets/product_order_item_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final String id;
  const OrderDetailScreen({Key? key, required this.id}) : super(key: key);

  static const String nameRoute = 'order-detail';
  static const String pathRoute = ':id';

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        title: Text('Track order'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            1,
                          ),
                        ),
                      ]),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.description,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                    text: 'Mã đơn hàng: ',
                                    children: [
                                      TextSpan(
                                          text: 'SDF123123',
                                          style: defaultTextStyle.copyWith(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    style: defaultTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                'Ngày đặt hàng: 16:24, 20-07-2024',
                                style: defaultTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Text('Đã giao hàng',
                                  style: defaultTextStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Địa chỉ người nhận',
                                  style: defaultTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Huu Tho'),
                                Text('0989338420'),
                                Text(
                                  '231 Nguyen Tri Phuong, Long Thanh, Tan Chau, An Giang',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    ProductOrderItemWidget(),
                    ProductOrderItemWidget(),
                    ProductOrderItemWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Hình thức giao hàng',
                                  style: defaultTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Giao hàng tiết kiệm')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.wallet_outlined,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Hình thức thanh toán',
                                  style: defaultTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Thanh toán khi nhận hàng')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tạm tính',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        Text('105.000.000 đ'),
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phí vận chuyển',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        Text('+ 30.000 đ'),
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Khuyến mãi',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        Text('- 1.000.000 đ'),
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Thành tiền'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '103.098.000 đ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Đã bao gồm VAT nếu có')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(149, 157, 165, 0.2),
                    blurRadius: 24,
                    spreadRadius: 0,
                    offset: Offset(
                      0,
                      8,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Mua lại',
            style: defaultTextStyle.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.2),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
