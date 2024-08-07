import 'package:admin_e_commerce/features/add_ads/add_ads_web.dart';
import 'package:admin_e_commerce/features/add_ads/logic/cubit/add_ads_cubit.dart';
import 'package:admin_e_commerce/features/add_products/logic/cubit/add_products_cubit.dart';
import 'package:admin_e_commerce/features/add_products/ui/adding_product_web_layout.dart';
import 'package:admin_e_commerce/features/all_products/ui/display_all_products.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());

  static DashBoardCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<Widget> dashBoardScreens = [
    BlocProvider(
      create: (context) => AddProductsCubit(),
      child: const AddingProductWebLayout(),
    ),
    const DisplayAllProducts(),
    BlocProvider(
      create: (context) => AddAdsCubit(),
      child: const AddAdsWebScreen(),
    )
  ];

  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }
}
