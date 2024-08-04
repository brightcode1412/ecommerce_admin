import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFromFieldText extends StatelessWidget {
  const CustomTextFromFieldText(
      {super.key,
      required this.labelText,
      this.controller,
      this.keyboardType,
      required this.validator});

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.green75Color,
      keyboardType: keyboardType,
      // maxLines: ,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
    );
  }
}
