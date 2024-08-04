import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFromFieldText extends StatelessWidget {
  const CustomTextFromFieldText(
      {super.key, required this.labelText, this.controller});

  final TextEditingController? controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.green75Color,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a product name';
        }
        return null;
      },
    );
  }
}
