import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/common_widgets/text_input_widget.dart';
import '../../shared/constants/api_url.dart';
import 'models/AddressModel.dart';
import 'providers/address_provider.dart';
import 'widgets/label_and_input_widget.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'add-address';
  static const String pathRoute = 'add';

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  bool _isDefault = false;

  final addressNameController = TextEditingController();

  final recipientNameController = TextEditingController();

  final phoneAddressController = TextEditingController();

  final detailAddressController = TextEditingController();

  void _onSubmit() async {
    final address = AddressModel(
        idUser: int.parse(ApiUrl.ACCOUNT_ID),
        nameAddress: addressNameController.text,
        nameRecipient: recipientNameController.text,
        phoneRecipient: phoneAddressController.text,
        idCity: 0,
        idDistrict: 0,
        idWard: 0,
        detailAddress: detailAddressController.text,
        isDefault: _isDefault ? 1 : 0);
    ref.read(asyncAddressNotifierProvider.notifier).addAddress(address);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm địa chỉ mới'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              LabelAndInputWidget(
                  label: 'Tên địa chỉ',
                  hintText: 'Nhập tên địa chỉ',
                  controller: addressNameController),
              LabelAndInputWidget(
                  label: 'Người nhận',
                  hintText: 'Họ tên người nhận',
                  controller: recipientNameController),
              LabelAndInputWidget(
                  label: 'Số điện thoại',
                  hintText: 'Số diện thoại người nhận',
                  controller: phoneAddressController),
              LabelAndInputWidget(
                  label: 'Đia chỉ',
                  hintText: 'Nhập địa chỉ cụ thể',
                  controller: detailAddressController),
              Row(
                children: [
                  Checkbox.adaptive(
                    value: _isDefault,
                    onChanged: (value) {
                      setState(() {
                        _isDefault = value!;
                      });
                    },
                  ),
                  Text('Đặt đây làm địa chỉ mặc định')
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Thêm',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: _onSubmit,
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
