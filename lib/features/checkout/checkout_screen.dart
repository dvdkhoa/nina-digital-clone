import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/extensions/string_ext.dart';
import '../address/models/AddressModel.dart';
import '../address/providers/address_provider.dart';
import 'select_address_screen.dart';
import '../cart/providers/cart_provider.dart';
import '../payment/payment_method_screen.dart';
import '../promotion/promotion_screen.dart';
import '../ship_method/ship_method_screen.dart';
import 'widgets/product_item_widget.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const nameRoute = 'checkout';
  static const pathRoute = '/checkout';

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  AddressModel? _chooseAddress = null;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    final asyncAddressValue = ref.watch(asyncAddressNotifierProvider);

    final listProduct = ref.watch(cartProvider.select((value) => value.dsCart));

    return Scaffold(
      appBar: AppBar(
        title: Text('Thủ tục thanh toán'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Địa chỉ giao hàng',
                  style: defaultTextStyle.copyWith(fontSize: 15)),
              asyncAddressValue.when(
                data: (data) {
                  final defaultAddress =
                      data.firstWhere((item) => item.isDefault == 1);
                  return InkWell(
                    onTap: () async {
                      final data = _chooseAddress ?? defaultAddress;

                      final returnValue = await context.pushNamed(
                          SelectAddressScreen.nameRoute,
                          extra: data);

                      if (returnValue != null) {
                        AddressModel? returnAddress =
                            returnValue as AddressModel;
                        setState(() {
                          _chooseAddress = returnAddress;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
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
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xffEAF5FD),
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xff0A70B8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    _chooseAddress?.nameAddress ??
                                        defaultAddress.nameAddress,
                                    style: defaultTextStyle.copyWith(
                                        fontSize: 15)),
                                Text(
                                    _chooseAddress?.detailAddress ??
                                        defaultAddress.detailAddress,
                                    style: defaultTextStyle.copyWith(
                                        fontSize: 10,
                                        color: const Color(0xff686868)))
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.border_color_outlined))
                        ],
                      ),
                    ),
                  );
                },
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
              ),
              Divider(
                height: 40,
              ),
              Text(
                'Danh sách sản phẩm',
                style: defaultTextStyle.copyWith(fontSize: 15),
              ),
              Column(
                children: listProduct!
                    .map((item) => ProductItemWidget(model: item))
                    .toList(),
              ),
              Divider(
                height: 20,
              ),
              Text(
                'Phương thức vận chuyển',
                style: defaultTextStyle.copyWith(fontSize: 15),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(ShipMethodScreen.nameRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.fire_truck),
                    Text(
                      'Chọn phương thức vận chuyển',
                      style: defaultTextStyle.copyWith(fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
              Divider(
                height: 30,
              ),
              Text(
                'Mã khuyến mãi',
                style: defaultTextStyle.copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        filled: true,
                        fillColor: Color(0xffF5F5F5),
                        hintText: 'Nhập mã khuyến mãi',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25))),
                  )),
                  SizedBox(
                    width: 6,
                  ),
                  IconButton(
                    onPressed: () {
                      context.pushNamed(PromotionScreen.nameRoute);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    style: IconButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xff0A70B8)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tạm tính'),
                        Text(
                          ref
                              .read(cartProvider.notifier)
                              .totalPrice()
                              .formattedVNDCustom(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Vận chuyển'),
                        Text(
                          '-',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tổng'),
                        Text(
                          '-',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(PaymentMethodScreen.nameRoute);
          },
          child: Text('Tiếp tục thanh toán',
              style:
                  defaultTextStyle.copyWith(color: Colors.white, fontSize: 15)),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ),
      ),
    );
  }
}
