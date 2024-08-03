import 'package:admin_e_commerce/core/routing/app_router.dart';
import 'package:admin_e_commerce/core/routing/routes.dart';
import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:flutter/material.dart';

class DelishDeliveryAdmin extends StatelessWidget {
  const DelishDeliveryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.green75Color),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashBoardScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
