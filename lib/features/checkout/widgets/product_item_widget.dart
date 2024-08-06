import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/api_url.dart';
import '../../../shared/extensions/string_ext.dart';
import '../../cart/models/cart_item_model.dart';

class ProductItemWidget extends ConsumerWidget {
  final CartItemModel model;

  const ProductItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
          ]),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.jpg',
                  image:
                      '${ApiUrl.resourcesURL}/upload/product/${model.photo}')),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        model.namevi,
                        style: defaultTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Màu sắc: note',
                    style: defaultTextStyle.copyWith(
                        fontSize: 12, color: Color(0xff6B6B6B))),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.getAmount().formattedVNDCustom(),
                        style: TextStyle(color: Colors.red),
                      ),
                      Container(
                        width: 34,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffF3F3F3), shape: BoxShape.circle),
                        child: Text(
                          model.quantity.toString(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
