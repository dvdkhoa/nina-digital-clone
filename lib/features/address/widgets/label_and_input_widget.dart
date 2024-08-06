import 'package:flutter/material.dart';

class LabelAndInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const LabelAndInputWidget(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: controller,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF4F4F4),
              hintText: hintText,
              focusedErrorBorder: _errorInputBorder,
              errorBorder: _errorInputBorder,
              focusedBorder: _normalInputBorder,
              enabledBorder: _enableInputBorder,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            ),
          )
        ],
      ),
    );
  }
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(15)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(15)));

const _errorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);
