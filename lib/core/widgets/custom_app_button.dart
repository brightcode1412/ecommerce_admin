import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key,
      required this.width,
      required this.height,
      this.onPressed,
      this.borderRadius,
      this.style,
      this.backgroundColor,
      this.foregroundColor,
      this.disabledForegroundColor,
      this.disabledBackgroundColor,
      required this.child});
  final double width, height;
  final void Function()? onPressed;

  final double? borderRadius;
  final TextStyle? style;
  final Widget child;
  final Color? backgroundColor,
      foregroundColor,
      disabledForegroundColor,
      disabledBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor ?? Colors.white,
        backgroundColor: backgroundColor ?? AppColor.green75Color,
        disabledBackgroundColor:
            disabledBackgroundColor ?? const Color(0xFFAAD2FF),
        disabledForegroundColor: disabledForegroundColor ?? Colors.white,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
        ),
      ),
      child: child,
    );
  }
}
