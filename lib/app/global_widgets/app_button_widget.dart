import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final void Function() onPressed;

  const AppButtonWidget({
    Key? key,
    required this.text,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.fontSize = AppDimensions.fontSize16,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
