import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../localizations/language_ext.dart';
import '../../shared/common_widgets/primary_button_widget.dart';
import '../register/register_screen.dart';
import 'login_password_screen.dart';

TextStyle textStyle = TextStyle(fontSize: 13, color: Colors.black);

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'login';
  static const String pathRoute = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/man_phone.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Let's you in",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: double.infinity,
              child: _buttonLoginWith(Image.asset('assets/images/fb.png'),
                  context.translate.login_with_fb),
            ),
            Container(
              width: double.infinity,
              child: _buttonLoginWith(Image.asset('assets/images/gg.png'),
                  context.translate.login_with_google),
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color(0xFFEBEBEB),
                  margin: const EdgeInsets.only(top: 3),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Hoặc',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: PrimaryButtonWidget(
                text: 'Đăng nhập bằng mật khẩu',
                clickEvent: () {
                  context.goNamed(LoginPasswordScreen.nameRoute);
                  // print('ablc');
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'Bạn chưa có tài khoản? ',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.grey),
                children: [
                  TextSpan(
                      text: 'Đăng ký',
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(color: Colors.black),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(RegisterScreen.nameRoute);
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    side: const BorderSide(width: 0.5, color: Color(0xFFEBEBEB)));

Widget _buttonLoginWith(image, text) {
  return OutlinedButton(
    onPressed: () {},
    style: buttonStyle,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 22,
          height: 22,
          margin: EdgeInsets.only(right: 10),
          child: image,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    ),
  );
}
