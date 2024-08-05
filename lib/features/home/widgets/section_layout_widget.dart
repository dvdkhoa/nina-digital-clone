import 'package:flutter/material.dart';

class SectionLayoutWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final Function onButtonClick;
  SectionLayoutWidget(
      {Key? key,
      required this.title,
      required this.child,
      required this.onButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: defaultTextStyle.copyWith(
                    color: const Color(0xFF0A70B8), fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  onButtonClick();
                },
                child: Text(
                  'Tất cả',
                  style: defaultTextStyle.copyWith(
                      color: Colors.black, fontSize: 13),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: child,
          )
        ],
      ),
    );
  }
}
