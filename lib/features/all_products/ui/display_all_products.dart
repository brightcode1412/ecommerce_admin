import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_state.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_cubit.dart';

class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplatAllProductsCubit()..getAllProducts(),
      child: Scaffold(
        body: BlocBuilder<DisplatAllProductsCubit, DisplatAllProductsState>(
          builder: (context, state) {
            if (state is DisplatAllProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DisplatAllProductsError) {
              return Center(child: Text(state.error));
            }
            state as DisplatAllProductsLoaded;
            return Expanded(child: _buildGridView(state.products, context));
          },
        ),
      ),
    );
  }

  Widget _buildGridView(products, context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildGridItem(products[index], context);
      },
    );
  }

  Widget _buildGridItem(ProductModel product, context) {
    var width = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.9,
      height: high * 0.8,
      child: Card(
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                product.imagesUrl.isNotEmpty ? product.imagesUrl[0] : '',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
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
}
