import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/features/app_layout/logic/app_layout_cubit/app_layout_cubit.dart';
import 'package:admin_e_commerce/features/app_layout/ui/widgets/custom_appbar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);

        return Scaffold(
          appBar: CustomAppBarMobile(
            title: 'Admin Panel',
          ),
          body: cubit.mobileScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.changeIndex,
            selectedItemColor: AppColor.whiteColor,
            unselectedItemColor: AppColor.whiteColor,
            backgroundColor: AppColor.green75Color,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Product',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits),
                label: 'All Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ads_click),
                label: 'Add Ads',
              ),
            ],
          ),
        );
      },
    );
  }
}
