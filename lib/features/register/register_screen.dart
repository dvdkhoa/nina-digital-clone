import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/common_widgets/box_button_widget.dart';
import '../../shared/common_widgets/primary_button_widget.dart';
import '../../shared/common_widgets/text_input_widget.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import '../../shared/extensions/string_ext.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'register';
  static const String pathRoute = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isChecked = true;
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final re_passController = TextEditingController();

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
                'Đăng ký tài khoản',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextInputWidget(
                        context: context,
                        icon: const icons.MailSolid(
                          width: 16,
                          height: 16,
                        ),
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Không được bỏ trống';
                          }
                          if (!value.isValidEmail) return 'Email không hợp lệ';
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextInputWidget(
                          context: context,
                          icon: const icons.Phone(
                            width: 16,
                            height: 16,
                          ),
                          hintText: 'Số điện thoại',
                          inputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                            if (!value.isValidPhone)
                              return 'Số điện thoại không hợp lệ';
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextInputWidget(
                          controller: passController,
                          context: context,
                          icon: const icons.PasswordCheck(
                            width: 16,
                            height: 16,
                          ),
                          hintText: 'Mật khẩu',
                          inputType: TextInputType.text,
                          secure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                            if (!value.isValidPassword)
                              return 'Mật khẩu không hợp lệ';
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextInputWidget(
                          controller: re_passController,
                          context: context,
                          icon: const icons.PasswordCheck(
                            width: 16,
                            height: 16,
                          ),
                          hintText: 'Xác nhận mật khẩu',
                          inputType: TextInputType.text,
                          secure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                            if (value != passController.text) {
                              return 'Nhập lại mật khẩu không đúng';
                            }
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: PrimaryButtonWidget(
                  text: 'Đăng ký',
                  clickEvent: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
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
                  text: 'Bạn đã có tài khoản? ',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: 'Đăng nhập',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(LoginScreen.nameRoute);
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
    );
  }
}