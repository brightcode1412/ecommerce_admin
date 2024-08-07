import 'package:admin_e_commerce/adaptive_layout.dart';
import 'package:admin_e_commerce/core/routing/routes.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_cubit.dart';
import 'package:admin_e_commerce/features/all_products/ui/display_all_products.dart';
import 'package:admin_e_commerce/features/app_layout/logic/app_layout_cubit/app_layout_cubit.dart';
import 'package:admin_e_commerce/features/app_layout/ui/app_layout.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/ui/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.dashBoardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DashBoardCubit(),
            child: const DashBoardScreen(),
          ),
        );
      case Routes.displayProductScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DisplatAllProductsCubit()..getAllProducts(),
            child: const DisplayAllProducts(),
          ),
        );

      case Routes.adaptiveLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => AdaptiveLayout(
            mobileLayout: (context) {
              return BlocProvider(
                create: (context) => AppLayoutCubit(),
                child: const AppLayout(),
              );
            },
            webLayout: (context) {
              return BlocProvider(
                create: (context) => DashBoardCubit(),
                child: const DashBoardScreen(),
              );
            },
          ),
        );
    }

    return null;
  }
}
