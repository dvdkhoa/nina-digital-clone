import 'package:flutter/material.dart';
import 'package:nina_digital/features/home/models/product_list_model.dart';

import '../../../shared/extensions/string_ext.dart';

class CategoryListFilterWidget extends StatelessWidget {
  List<ProductListModel> list;

  CategoryListFilterWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: FilterChip(
            label: Text(
              list[index].namevi.capitalize(),
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(color: Colors.black, fontSize: 13),
            ),
            selected: false,
            showCheckmark: false,
            selectedColor: Color(0xff0A70B8),
            side: const BorderSide(
              color: Colors.black,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            onSelected: (bool value) {},
          ),
        ),
        itemCount: _categories.length,
      ),
    );
  }
}

List<Map<String, dynamic>> _categories = [
  {'title': 'Điện thoại', 'image': 'phone_cat.png'},
  {'title': 'Smartwatch', 'image': 'swatch_cat.png'},
  {'title': 'Smart TV', 'image': 'tv_cat.png'},
  {'title': 'Màn LED', 'image': 'led_cat.png'},
  {'title': 'Laptop', 'image': 'laptop_cat.png'},
  {'title': 'Loa - Tai nghe', 'image': 'mphone_cat.png'},
];
