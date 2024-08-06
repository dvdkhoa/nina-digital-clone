import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/common_widgets/item_checked_widget.dart';
import 'models/mock_model.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'promotion';
  static const String pathRoute = '/promotion';

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm mã khuyến mãi'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: promotions
                .map(
                  (promotion) => ItemCheckedWidget(
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
                    title: promotion['title'].toString(),
                    desc: promotion['desc'].toString(),
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
