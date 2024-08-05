import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotOptionWidget extends StatelessWidget {
  final icon;
  final String title;
  final String desc;
  final bool isChecked;
  final Function onClick;
  const ForgotOptionWidget(
      {Key? key,
      this.icon,
      required this.title,
      required this.desc,
      required this.isChecked,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/icons/$icon',
                  width: 24,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffEAF5FD)),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(desc),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: isChecked ? Color(0xff0A70B8) : Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
