import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/shared/utils/helper.dart';

import 'reset_password_screen.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'confirm-code';
  static const String pathRoute = 'confirm-code';

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  String _randomString = '';
  TextEditingController _inputCapChaController = TextEditingController();

  void _buildCaptcha() {
    _randomString = Helper.generateUniqueString(maxLength: 6);
    setState(() {});
  }

  void _submitForm() {
    if (_inputCapChaController.text != _randomString) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nhập sai mã bảo vệ'),
        ),
      );
      return;
    }
    context.goNamed(ResetPasswordScreen.nameRoute);
  }

  @override
  void initState() {
    super.initState();
    _buildCaptcha();
  }

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
                'Nhập Email mà bạn đã đăng ký để thực hiện đặt lại mật khẩu.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _inputCapChaController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outlined),
                          hintText: 'Mã bảo vệ',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        _randomString,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff0A70B8),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                      width: 30,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.refresh)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Xác nhận', style: TextStyle(color: Colors.white)),
          onPressed: () {
            _submitForm();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
        ),
      ),
    );
  }
}
