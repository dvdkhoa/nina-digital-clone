import 'package:flutter/material.dart';

Widget TextInputWidget(
    {required context,
    required Widget icon, 
    required String hintText,
    required TextInputType inputType,
    TextEditingController? controller,
    bool secure = false,
    String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    obscureText: secure,
    validator: validator,
    style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
    decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: icon,
        ),
        filled: true,
        fillColor: Color(0xFFF4F4F4),
        hintText: hintText,
        focusedErrorBorder: _errorInputBorder,
        errorBorder: _errorInputBorder,
        focusedBorder: _normalInputBorder,
        enabledBorder: _enableInputBorder,
        contentPadding: EdgeInsets.all(5.0)),
  );
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(20)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(20)));

const _errorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
);
