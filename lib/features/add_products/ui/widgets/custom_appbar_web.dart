import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWeb extends StatelessWidget {
  const CustomAppBarWeb({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: AppColor.green75Color),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            Assets.imagesCarrot,
            width: 35,
            height: 35,
            colorFilter: const ColorFilter.mode(
              AppColor.whiteColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppStyles.eduAUVICWANTHand700(context).copyWith(
              color: AppColor.whiteColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
