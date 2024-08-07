import 'package:admin_e_commerce/features/add_ads/logic/cubit/add_ads_cubit.dart';
import 'package:admin_e_commerce/features/add_ads/ui/add_ads_mobile.dart';
import 'package:admin_e_commerce/features/add_products/logic/cubit/add_products_cubit.dart';
import 'package:admin_e_commerce/features/add_products/ui/adding_product_mobile_layout.dart';
import 'package:admin_e_commerce/features/all_products/ui/display_all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());

  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> mobileScreens = [
    BlocProvider(
      create: (context) => AddProductsCubit(),
      child: const AddingProductMobileLayout(),
    ),
    const DisplayAllProducts(),
    BlocProvider(
      create: (context) => AddAdsCubit(),
      child: const AddAdsMobileScreen(),
    )
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppLayoutCubitIndexChange());
  }
}
