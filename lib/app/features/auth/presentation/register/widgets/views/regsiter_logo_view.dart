import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/values/export/export_values.dart';
import '../../register_controller.dart';

class RegisterLogoView extends GetView<RegisterController> {
  const RegisterLogoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin100,
        vertical: AppDimensions.paddingOrMargin40,
      ),
      child: Image.asset(
        AppAssets.logo,
      ),
    );
  }
}
