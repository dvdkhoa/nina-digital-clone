import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/api_url.dart';
import '../../../shared/extensions/string_ext.dart';
import '../../checkout/models/order_model.dart';
import '../order_detail_screen.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel model;
  const OrderItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    // Tạo một đối tượng DateTime từ timestamp
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(model.dateCreated! *
        1000); // Chú ý nhân với 1000 vì DateTime tính bằng milliseconds

    // Định dạng datetime theo ý muốn (ví dụ: dd/MM/yyyy HH:mm:ss)
    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    String dateCreated = formatter.format(dateTime);

    return GestureDetector(
      onTap: () {
        context.pushNamed(OrderDetailScreen.nameRoute, extra: model);
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
                  dateCreated,
                  style: defaultTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            Divider(
              height: 10,
            ),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${ApiUrl.resourcesURL}/upload/product/${model.details?[0]?.photo}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SpinKitCircle(size: 20, color: Colors.red,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10,),
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
                          // Text(
                          //   'Màu sắc: Gold',
                          //   style: defaultTextStyle.copyWith(
                          //     fontSize: 12,
                          //     color: Color(0xff6B6B6B),
                          //   ),
                          // ),
                          Text(
                            'Số lượng: ${model.details?[0].quantity}',
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
                            model.totalPrice?.formattedVNDCustom() ?? '',
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
