import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/login_password_screen.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final Function clickEvent;
  const PrimaryButtonWidget(
      {Key? key, required this.text, required this.clickEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        this.clickEvent();
      },
      child: Text(
        this.text,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF0A70B8),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
