import 'package:flutter/material.dart';

class ItemCheckedWidget extends StatelessWidget {
  final Widget leading;
  final String title;
  final String desc;
  final Widget? suffix;
  final bool isDefault;
  const ItemCheckedWidget(
      {Key? key,
      required this.leading,
      required this.title,
      required this.desc,
      this.isDefault = false,
      this.suffix = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.2),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                8,
              ),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: defaultTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: defaultTextStyle.copyWith(
                      fontSize: 10, color: Color(0xff686868)),
                )
              ],
            ),
          ),
          suffix ?? SizedBox(),
          Icon(
            isDefault
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Color(0xff0A70B8),
          )
        ],
      ),
    );
  }
}
