import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/common_widgets/box_button_widget.dart';
import '../../shared/common_widgets/primary_button_widget.dart';
import '../../shared/common_widgets/text_input_widget.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'password';
  static const String pathRoute = 'password';

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  bool _isChecked = true;
  final _formKey = GlobalKey<FormState>();

  _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Submit!!!')));

      context.goNamed(HomeScreen.nameRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    child: Image.asset(
                  'assets/images/login-logo.png',
                  fit: BoxFit.cover,
                )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Đăng nhập',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      TextInputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                          },
                          context: context,
                          icon: const icons.MailSolid(
                            width: 16,
                            height: 16,
                          ),
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      TextInputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                          },
                          context: context,
                          icon: const icons.PasswordCheck(
                            width: 16,
                            height: 16,
                          ),
                          hintText: 'Mật khẩu',
                          inputType: TextInputType.text,
                          secure: true),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        print('change: $newValue');
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    Text('Nhớ mật khẩu'),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: PrimaryButtonWidget(
                    text: 'Đăng nhập',
                    clickEvent: _login,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context.pushNamed(ForgotPasswordScreen.nameRoute);
                    },
                    child: Text(
                      'Quên mật khẩu?',
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 13, color: Colors.black),
                    )),
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
                        'Hoặc tiếp tục với',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxButtonWidget(imageName: 'fb.png'),
                    SizedBox(
                      width: 10,
                    ),
                    BoxButtonWidget(imageName: 'gg.png')
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                              context.goNamed(RegisterScreen.nameRoute);
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _textInput(
//     {required context,
//     required Widget icon,
//     required String hintText,
//     required TextInputType inputType,
//     bool secure = false}) {
//   return TextField(
//     obscureText: secure,
//     style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
//     decoration: InputDecoration(
//         prefixIcon: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//           child: icon,
//         ),
//         filled: true,
//         fillColor: Color(0xFFF4F4F4),
//         hintText: hintText,
//         focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(Radius.circular(20)))),
//   );
// }

// Widget _boxButton({required String imageName}) {
//   return OutlinedButton(
//     onPressed: () {},
//     child: Image.asset('assets/images/${imageName}'),
//     style: OutlinedButton.styleFrom(
//         side: const BorderSide(
//           width: 0.5,
//           color: Color(0xFFEBEBEB),
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 10)),
//   );
// }
