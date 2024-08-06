import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
            const SizedBox(
              height: 20,
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: LayoutSelction()),
                SizedBox(
                  width: 100,
                ),
                AddProductLayout(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LayoutSelction extends StatelessWidget {
  const LayoutSelction({super.key});

  static List<String> items = ['Add Product', 'Add Product'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 200, // Set the desired width here
          child: SelectionItem(item: items[index]),
        );
      },
      itemCount: items.length,
    );
  }
}

class AddProductLayout extends StatelessWidget {
  const AddProductLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    lineWidth: 13.0,
                    percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
                    center: Text('${state.uploadProgress.toInt()}%'),
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
                        borderRadius: 10,
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
    );
  }
}

class SelectionItem extends StatelessWidget {
  const SelectionItem({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColor.green75Color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        item,
        style: AppStyles.eduAUVICWANTHand700(context).copyWith(
          color: AppColor.whiteColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
