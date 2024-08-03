import 'package:admin_e_commerce/core/routing/routes.dart';
import 'package:admin_e_commerce/features/add_image/logic/cubit/image_web_cubit.dart';
import 'package:admin_e_commerce/features/home/data/repos/home_repo.dart';
import 'package:admin_e_commerce/features/home/logic/cubit/home_cubit.dart';
import 'package:admin_e_commerce/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_image/data/repo.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: homeScreen(),
          ),
        );
    }

    return null;
  }
}
