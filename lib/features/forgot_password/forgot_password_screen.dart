import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/confirm_code_screen.dart';
import 'widgets/forgot_option_list_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'forgot-password';
  static const String pathRoute = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quên mật khẩu'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/forgot-pass.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Chọn với chi tiết liên hệ nếu chúng tôi sử dụng để đặt lại mật khẩu của bạn',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              ForgotOptionListWidget(),
              SizedBox(
                height: 10,
              ),
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
            context.goNamed(ConfirmCodeScreen.nameRoute);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
        ),
      ),
    );
  }
}
