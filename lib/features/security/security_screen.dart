import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'security';
  static const String pathRoute = '/security';

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảo vệ tài khoản'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            _SecurityAccountItem(
              title: 'Nhớ tài khoản ',
              isChecked: true,
            ),
            _SecurityAccountItem(
              title: 'Face ID',
              isChecked: true,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Thay đổi mật khẩu',
                  style: defaultTextStyle.copyWith(fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE7E7E7),
                    padding: EdgeInsets.symmetric(vertical: 13)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _SecurityAccountItem extends StatelessWidget {
  final String title;
  final bool isChecked;

  const _SecurityAccountItem(
      {super.key, required this.title, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          SizedBox(
            height: 30,
            width: 40,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch.adaptive(
                  inactiveTrackColor: Colors.grey.shade200,
                  inactiveThumbColor: Colors.white,
                  value: isChecked,
                  onChanged: (value) {}),
            ),
          ),
        ],
      ),
    );
  }
}
