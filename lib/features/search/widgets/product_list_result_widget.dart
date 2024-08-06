import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nina_digital/features/search/widgets/box_product_widget.dart';

import '../../../shared/providers/models/product_model.dart';

class ProductListResultWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductListResultWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: AlignedGridView.count(
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
      ),
    );
  }
}
