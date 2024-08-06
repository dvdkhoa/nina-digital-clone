import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:isar/isar.dart';
import 'package:nina_digital/shared/providers/models/product_model.dart';

import '../../features/home/widgets/box_product_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BoxProductWidget(
          product: products[index],
        );
      },
    );
  }
}
