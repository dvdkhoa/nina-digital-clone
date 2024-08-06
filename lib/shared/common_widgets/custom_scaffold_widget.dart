import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget body;
  const CustomScaffoldWidget(
      {Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // leading: Container(
        //     margin: EdgeInsets.only(left: 25),
        //     child: Image.asset('assets/images/g22.png')),
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                print('search');
              },
              icon: SvgPicture.asset('assets/icons/search.svg'))
        ],
      ),
      body: body,
    );
  }
}
