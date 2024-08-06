import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/extensions/string_ext.dart';
import '../checkout/checkout_screen.dart';
import 'models/cart_item_model.dart';
import 'providers/cart_provider.dart';
import 'widgets/cart_item_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'cart';
  static const String pathRoute = '/cart';

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // @override
  // void initState() {
  //   ref.read(cartProvider.notifier).getCart();
  // }

  @override
  Widget build(BuildContext context) {
    List<CartItemModel> list =
        ref.watch(cartProvider.select((value) => value.dsCart!));

    double totalPrice = 0;
    for (final item in list) {
      totalPrice += item.getAmount();
    }

    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 80),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: list.map((item) => CartItemWidget(model: item)).toList(),
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tạm tính'),
                      Text(
                        totalPrice.formattedVNDCustom(),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(CheckoutScreen.nameRoute);
                    },
                    child: Text(
                      'Thanh toán',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0A70B8)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
