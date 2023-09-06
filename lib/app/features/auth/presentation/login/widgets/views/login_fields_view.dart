import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/values/export/export_values.dart';
import '../../../../../../global_widgets/export/export_global_widgets.dart';
import '../../login_controller.dart';

class LoginFieldsView extends GetView<LoginController> {
  const LoginFieldsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PhoneNumber
        AppTextFieldWidget(
          controller: controller.state().phoneNumberController,
          hintText: AppStrings.phoneNumber.tr,
        ),

        // Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin08,
        ),

        // Password
        AppTextFieldWidget(
          controller: controller.state().passwordController,
          hintText: AppStrings.password.tr,
        ),
      ],
    );
  }
}
