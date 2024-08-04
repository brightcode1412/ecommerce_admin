import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            BlocConsumer<DashBoardCubit, DashBoardState>(
              listener: (context, state) {
                if (state is ImageUploadFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Image Upload Failed'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                var cubit = DashBoardCubit.get(context);
                return state is ImageLoading
                    ? LinearPercentIndicator(
                        // width: MediaQuery.sizeOf(context).width * .4,
                        lineHeight: 14.0,
                        percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
                        center: Text('${state.uploadProgress.toInt()}%'),

                        progressColor: AppColor.green75Color,
                      )
                    : state is ImageUploadSuccess ||
                            state is DashBoardUploadProductLoading
                        ? Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: cubit.images.map((image) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 50,
                                  foregroundImage: MemoryImage(image),
                                ),
                              );
                            }).toList(),
                          ))
// default ال
                        : CustomAppButton(
                            backgroundColor: state is ImageLoading
                                ? AppColor.grey64Color
                                : AppColor.green75Color,
                            width: MediaQuery.sizeOf(context).width * .1,
                            height: 36,
                            onPressed: state is ImageLoading
                                ? () {}
                                : () {
                                    context.read<DashBoardCubit>().pickImages();
                                  },
                            child: const Text('Upload Images'));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const AddingProductBody(),
          ],
        ),
      ),
    );
  }
}
