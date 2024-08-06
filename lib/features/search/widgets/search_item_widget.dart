import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchItemWidget extends StatelessWidget {
  final String title;
  const SearchItemWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Color(0xff757575), fontSize: 13),
          ),
          SvgPicture.asset('assets/icons/delete-search.svg')
        ],
      ),
    );
  }
}
