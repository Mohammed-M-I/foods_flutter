import 'package:flutter/material.dart';
import '../core/values/app_dimensions.dart';

import '../core/values/app_colors.dart';

class AppProgressWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const AppProgressWidget({
    Key? key,
    this.padding = const EdgeInsets.all(
      AppDimensions.zero,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
