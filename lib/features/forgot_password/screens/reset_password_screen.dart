import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/shared/common_widgets/text_input_widget.dart';

import '../../login/login_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'reset-password';
  static const String pathRoute = 'reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo mật khẩu mới'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset('assets/images/reset-password.png'),
              SizedBox(
                height: 40,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tạo mật khẩu mới cho bạn',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                  context: context,
                  hintText: 'Nhập mật khẩu mới',
                  icon: SvgPicture.asset('assets/icons/lock.svg'),
                  inputType: TextInputType.text,
                  secure: true),
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                  context: context,
                  hintText: 'Nhập lại mật khẩu',
                  icon: SvgPicture.asset('assets/icons/lock.svg'),
                  inputType: TextInputType.text,
                  secure: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _rememberPassword,
                    onChanged: (value) {
                      setState(() {
                        _rememberPassword = value!;
                      });
                    },
                  ),
                  Text('Nhớ mật khẩu'),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Tiếp tục', style: TextStyle(color: Colors.white)),
          onPressed: () {
            context.pushNamed(LoginPasswordScreen.nameRoute);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
        ),
      ),
    );
  }
}
