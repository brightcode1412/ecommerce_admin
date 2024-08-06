import 'package:flutter/material.dart';
import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
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
                  ? CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 14.0,
                      percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
                      center: Text(
                        '${state.uploadProgress.toInt()}%',
                        style: const TextStyle(
                          color: AppColor.green75Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: AppColor.green75Color,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 1200,
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
                          borderRadius: 10,
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
        ],
      ),
    );
  }
}
