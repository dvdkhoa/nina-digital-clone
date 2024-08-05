import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'help-center';
  static const String pathRoute = '/help-center';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trung tâm hỗ trợ'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _supportItem(
                  Icon(
                    Icons.support_agent,
                    color: Color(0xff0a70b8),
                  ),
                  'Chat với tư vấn viên',
                  () {}),
              _supportItem(SvgPicture.asset('assets/icons/website.svg'),
                  'Website', () {}),
              _supportItem(
                  SvgPicture.asset('assets/icons/fb.svg'), 'Facebook', () {}),
              _supportItem(SvgPicture.asset('assets/icons/instagram.svg'),
                  'Instagram', () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _supportItem(icon, text, onclick) {
  return InkWell(
    onTap: () {
      onclick();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.2),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                8,
              ),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 15,
          ),
          Text(text)
        ],
      ),
    ),
  );
}
