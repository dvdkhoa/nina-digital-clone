import 'package:flutter/material.dart';

class BoxButtonWidget extends StatelessWidget {
  final String imageName;
  const BoxButtonWidget({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Image.asset('assets/images/${imageName}'),
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 0.5,
            color: Color(0xFFEBEBEB),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10)),
    );
  }
}
