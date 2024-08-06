import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_state.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_cubit.dart';

class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: BlocBuilder<DisplatAllProductsCubit, DisplatAllProductsState>(
        builder: (context, state) {
          if (state is DisplatAllProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DisplatAllProductsLoaded) {
            return _buildGridView(state.products);
          } else if (state is DisplatAllProductsError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No products found'));
          }
        },
      ),
    );
  }

  Widget _buildGridView(products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildGridItem(products[index]);
      },
    );
  }

  Widget _buildGridItem(ProductModel product) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imagesUrl.isNotEmpty ? product.imagesUrl[0] : '',
              fit: BoxFit.cover,
              width: double.infinity,
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
            child: Text('\$${product.price}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
