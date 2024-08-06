import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/shared/constants/api_url.dart';
import 'package:nina_digital/shared/providers/models/product_model.dart';
import '../../../shared/extensions/string_ext.dart';
import '../../login/login_screen.dart';
import '../../product/product_detail_screen.dart';

import 'package:badges/badges.dart' as badges;

class BoxProductWidget extends StatelessWidget {
  final ProductModel product;
  const BoxProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return InkWell(
      onTap: () {
        context.pushNamed(ProductDetailScreen.nameRoute,
            pathParameters: {'id': product.id.toString()});
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5), // Bo tròn các góc
              boxShadow: const [
                BoxShadow(
                  color:
                      Color.fromARGB(82, 158, 158, 158), // Màu sắc của bóng đổ
                  blurRadius: 0.5, // Độ mờ của bóng đổ
                  spreadRadius: 0.5, // Độ lan tỏa của bóng đổ
                  offset: Offset(0.5, 0.5), // Vị trí của bóng đổ (x, y)
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Image.network(
                    // 'assets/images/iphone.png',
                    '${ApiUrl.resourcesURL}/upload/product/' +
                        product.photo.toString(),
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.namevi.toString(),
                    style: defaultTextStyle.copyWith(
                        fontSize: 13, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${product.salePrice?.formattedVNDCustom()} ',
                      style: defaultTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: product.regularPrice?.formattedVNDCustom(),
                          style: defaultTextStyle.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 8,
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                product.discount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
