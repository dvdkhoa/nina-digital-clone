import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/api_url.dart';
import '../../../shared/extensions/string_ext.dart';
import '../../../shared/utils/helper.dart';
import '../models/cart_item_model.dart';
import '../providers/cart_provider.dart';

class CartItemWidget extends ConsumerWidget {
  final CartItemModel model;
  final bool allowDelete;
  const CartItemWidget({Key? key, required this.model, this.allowDelete = true})
      : super(key: key);

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
              image: '${ApiUrl.resourcesURL}/upload/product/${model.photo}',
              placeholder: 'assets/images/placeholder.jpg',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                allowDelete
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              model.namevi,
                              style: defaultTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Xóa khỏi giỏ hàng',
                                              style: defaultTextStyle.copyWith(
                                                  fontSize: 20),
                                            ),
                                            Divider(
                                              height: 20,
                                            ),
                                            CartItemWidget(
                                              model: model,
                                              allowDelete: false,
                                            ),
                                            Divider(
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child: Text(
                                                      'Hủy',
                                                      style: defaultTextStyle
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                    onPressed: () {
                                                      context.pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Color(
                                                                    0xffE7E7E7),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        15)),
                                                  ),
                                                ),
                                                const SizedBox(width: 25),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child: Text('Đồng ý xóa',
                                                        style: defaultTextStyle
                                                            .copyWith(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white)),
                                                    onPressed: () async {
                                                  
                                                      final loading =
                                                          Loading(context);
                                                      loading.start();

                                                      bool kq = await ref
                                                          .read(cartProvider
                                                              .notifier)
                                                          .removeCartItem(
                                                              model.id);
                                                      await loading.stop();

                                                      AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.info,
                                                        animType:
                                                            AnimType.rightSlide,
                                                        title: 'Thông báo',
                                                        desc:
                                                            'Xóa sản phẩm khỏi giỏ hàng thành công',
                                                        btnCancelOnPress: () {},
                                                        btnOkOnPress: () {},
                                                      )..show();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Color(
                                                                    0xff0A70B8),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        15)),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete_outline_rounded),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              model.namevi,
                              style: defaultTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                Text('Màu sắc: note lại :v',
                    style: defaultTextStyle.copyWith(
                        fontSize: 12, color: Color(0xff6B6B6B))),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            model.getAmount().formattedVNDCustom(),
                            style: TextStyle(color: Colors.red),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (model.quantity != 1) {
                                    final newQuantity = model.quantity - 1;

                                    ref
                                        .read(cartProvider.notifier)
                                        .changeQuantity(
                                            model.idProduct, newQuantity);
                                  }
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Text(
                                model.quantity.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                  //   model.quantity += 1;
                                  //   _amount =
                                  //       widget.model.price * model.quantity;
                                  // });
                                  final newQuantity = model.quantity + 1;
                                  ref
                                      .read(cartProvider.notifier)
                                      .changeQuantity(
                                          model.idProduct, newQuantity);
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE8E8E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
