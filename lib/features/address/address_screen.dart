import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../address/models/mock_model.dart';
import '../address/widgets/address_item.dart';
import 'add_address_screen.dart';
import 'providers/address_provider.dart';
import 'update_address_screen.dart';

class AddressScreen extends ConsumerWidget {
  AddressScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'address';
  static const String pathRoute = '/address';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAddressesValue = ref.watch(asyncAddressNotifierProvider);

    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        title: Text('Địa chỉ giao hàng'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(asyncAddressNotifierProvider.notifier).refreshAddress();
        },
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: asyncAddressesValue.when(
                data: (data) {
                  return Column(
                    children: data.map(
                      (address) {
                        return InkWell(
                            onTap: () {
                              context.pushNamed(UpdateAddressScreen.nameRoute,
                                  extra: address);
                            },
                            child: AddressItem(model: address));
                      },
                    ).toList(),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('${error.toString()}: ${stackTrace.toString()}'),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              )),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Thêm địa chỉ mới',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            context.pushNamed(AddAddressScreen.nameRoute);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
