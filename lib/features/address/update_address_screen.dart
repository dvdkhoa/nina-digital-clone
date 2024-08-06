import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/common_widgets/text_input_widget.dart';
import '../../shared/constants/api_url.dart';
import 'models/AddressModel.dart';
import 'providers/address_provider.dart';
import 'widgets/label_and_input_widget.dart';

class UpdateAddressScreen extends ConsumerStatefulWidget {
  final AddressModel model;
  UpdateAddressScreen({Key? key, required this.model}) : super(key: key);

  static const String nameRoute = 'update-address';
  static const String pathRoute = 'update';

  @override
  ConsumerState<UpdateAddressScreen> createState() =>
      _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends ConsumerState<UpdateAddressScreen> {
  late bool _isDefault;

  late final TextEditingController addressNameController;

  late final TextEditingController recipientNameController;

  late final TextEditingController phoneAddressController;

  late final TextEditingController detailAddressController;

  void _onSubmit() async {

    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    final address = AddressModel(
        id: widget.model.id,
        idUser: int.parse(userInfo?.id ?? ''),
        nameAddress: addressNameController.text,
        nameRecipient: recipientNameController.text,
        phoneRecipient: phoneAddressController.text,
        idCity: 0,
        idDistrict: 0,
        idWard: 0,
        detailAddress: detailAddressController.text,
        isDefault: _isDefault ? 1 : 0);
    ref.read(asyncAddressNotifierProvider.notifier).updateAddress(address);
    context.pop();
  }

  @override
  void initState() {
    _isDefault = widget.model.isDefault != 0;

    addressNameController =
        TextEditingController(text: widget.model.nameAddress);
    recipientNameController =
        TextEditingController(text: widget.model.nameRecipient);
    phoneAddressController =
        TextEditingController(text: widget.model.phoneRecipient);
    detailAddressController =
        TextEditingController(text: widget.model.detailAddress);
  }

  @override
  void dispose() {
    addressNameController.dispose();
    recipientNameController.dispose();
    phoneAddressController.dispose();
    detailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật'),
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
            'Cập nhật',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: _onSubmit,
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
