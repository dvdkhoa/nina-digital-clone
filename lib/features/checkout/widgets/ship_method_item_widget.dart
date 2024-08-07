import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShipMethodItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  final bool isChecked;
  const ShipMethodItemWidget({
    Key? key,
    required this.title,
    required this.desc,
    this.isChecked = false,
    required this.price,
  }) : super(key: key);

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
          Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: Color(0xffEAF5FD), shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff0A70B8), shape: BoxShape.circle),
              child: SvgPicture.asset('assets/icons/box.svg'),
            ),
          ),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              price + 'k',
              style: TextStyle(color: Color(0xff0A70B8)),
            ),
          ),
          Icon(
            isChecked
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Color(0xff0A70B8),
          )
        ],
      ),
    );
  }
}
