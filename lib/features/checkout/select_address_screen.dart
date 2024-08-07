import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../address/models/AddressModel.dart';
import '../address/providers/address_provider.dart';
import 'widgets/address_item.dart';

class SelectAddressScreen extends ConsumerStatefulWidget {
  AddressModel checkedAddress;
  SelectAddressScreen({Key? key, required this.checkedAddress})
      : super(key: key);

  static const String nameRoute = 'select-address';
  static const String pathRoute = 'select-address';

  @override
  ConsumerState<SelectAddressScreen> createState() =>
      _SelectAddressScreenState();
}

class _SelectAddressScreenState extends ConsumerState<SelectAddressScreen> {
  late AddressModel _selectedAddress;

  @override
  void initState() {
    super.initState();
    _selectedAddress = widget.checkedAddress;
  }

  @override
  Widget build(BuildContext context) {
    final asyncAddressValue = ref.watch(asyncAddressNotifierProvider);

    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        title: Text('Địa chỉ giao hàng'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: asyncAddressValue.when(
            data: (data) {
              return Column(
                children: data.map(
                  (address) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedAddress = address;
                          });
                        },
                        child: AddressItem(
                            model: address,
                            isChecked: address.id == _selectedAddress.id));
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
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Apply',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            context.pop(_selectedAddress);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
