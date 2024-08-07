import 'package:admin_e_commerce/features/add_products/data/model/product_model.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_cubit.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_state.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildGridItem(ProductModel product, context) {
  return SizedBox(
    child: Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                product.imagesUrl.isNotEmpty ? product.imagesUrl[0] : '',
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${product.price}'),
          ),
          BlocBuilder<DisplatAllProductsCubit, DisplatAllProductsState>(
            builder: (context, state) {
              var cubit = context.read<DisplatAllProductsCubit>();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await cubit.deleteProduct(
                            product.producttId, product.imagesUrl);
                        AnimatedSnackBar.material(
                          'Product Deleted',
                          type: AnimatedSnackBarType.success,
                          duration: const Duration(seconds: 2),
                        );
                        await context
                            .read<DisplatAllProductsCubit>()
                            .getAllProducts();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
