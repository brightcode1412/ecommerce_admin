import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_state.dart';
import 'package:admin_e_commerce/features/all_products/ui/widget/build_grid_view.dart';
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
            return buildGridView(state.products, context);
          },
        ),
      ),
    );
  }
}
