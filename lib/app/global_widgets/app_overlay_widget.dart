import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';

class AppOverlayWidget extends StatelessWidget {
  final Gradient gradient;
  final double width;
  final double height;

  const AppOverlayWidget({
    Key? key,
    this.gradient = AppColors.linearGradient02,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}
