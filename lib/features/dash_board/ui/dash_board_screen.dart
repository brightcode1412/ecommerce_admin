import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashBoardCubit, DashBoardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBarWeb(
                  title: 'Delish Delivery Admin',
                ),
                Text(
                  'Add Product',
                  style: AppStyles.eduAUVICWANTHand700(context).copyWith(
                    color: AppColor.blackColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const AddingProductBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
