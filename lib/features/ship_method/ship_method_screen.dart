import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/common_widgets/item_checked_widget.dart';
import 'models/mock_model.dart';

class ShipMethodScreen extends StatelessWidget {
  const ShipMethodScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'ship-method';
  static const String pathRoute = '/ship-method';

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phương thức vận chuyển'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: ships
                .map(
                  (ship) => ItemCheckedWidget(
                    leading: Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffEAF5FD), shape: BoxShape.circle),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff0A70B8), shape: BoxShape.circle),
                        child: SvgPicture.asset('assets/icons/box.svg'),
                      ),
                    ),
                    title: ship['title'].toString(),
                    desc: ship['desc'].toString(),
                    suffix: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        ship['fee'].toString() + 'k',
                        style: TextStyle(color: Color(0xff0A70B8)),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Apply',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
