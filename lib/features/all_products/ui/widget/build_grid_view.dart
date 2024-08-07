import 'package:admin_e_commerce/features/all_products/ui/widget/build_grid_item.dart';
import 'package:flutter/material.dart';

Widget buildGridView(products, context) {
  var width = MediaQuery.of(context).size.width;
  return GridView.builder(
    padding: const EdgeInsets.all(8.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: width < 600 ? 2 : 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: width < 600 ? 0.80 : 1.5,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return buildGridItem(products[index], context);
    },
  );
}
