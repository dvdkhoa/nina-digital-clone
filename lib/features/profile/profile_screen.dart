import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'profile';
  static const String pathRoute = '/profile';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: 600),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  _textInputWidget(
                      hintText: 'Họ và tên', controller: nameController),
                  _textInputWidget(
                      hintText: 'Nickname', controller: nickNameController),
                  _textInputWidget(
                    hintText: 'Ngày sinh',
                    controller: emailController,
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  _textInputWidget(
                    hintText: 'Email',
                    controller: emailController,
                    icon: const Icon(
                      Icons.mail_outline,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  _textInputWidget(
                      hintText: 'Số điện thoại', controller: phoneController),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: DropdownButtonFormField(
                      value: -1,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 13),
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Giới tính',
                          ),
                          value: -1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Nữ',
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Nam',
                          ),
                          value: 1,
                        ),
                      ],
                      onChanged: (value) {
                        print('Giới tính: $value');
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4F4),
                        errorBorder: _errorInputBorder,
                        focusedBorder: _normalInputBorder,
                        enabledBorder: _enableInputBorder,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('update');
                  },
                  child: Text(
                    'Cập nhật',
                    style: defaultTextStyle.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0A70B8),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _textInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? icon;

  _textInputWidget(
      {required this.hintText, required this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: this.icon != null ? this.icon : null,
            filled: true,
            fillColor: const Color(0xFFF4F4F4),
            errorBorder: _errorInputBorder,
            focusedBorder: _normalInputBorder,
            enabledBorder: _enableInputBorder,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
      ),
    );
  }
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(14)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(14)));

const _errorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(14),
  ),
);
