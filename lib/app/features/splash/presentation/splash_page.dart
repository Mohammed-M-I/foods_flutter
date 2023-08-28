import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../../../core/values/constants/app_assets.dart';
import 'package:get/get.dart';

import '../../../global_widgets/app_progress_widget.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin100,
                ),
                child: Image.asset(
                  AppAssets.logo,
                ),
              ),
            ),
          ),

          // Progress
          const Padding(
            padding: EdgeInsets.only(
              bottom: AppDimensions.paddingOrMargin40,
            ),
            child: AppProgressWidget(),
          )
        ],
      ),
    );
  }
}
