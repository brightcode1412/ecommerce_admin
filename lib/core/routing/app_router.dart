import 'package:admin_e_commerce/core/routing/routes.dart';
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
            child:  DashBoardScreen(),
          ),
        );
    }

    return null;
  }
}
