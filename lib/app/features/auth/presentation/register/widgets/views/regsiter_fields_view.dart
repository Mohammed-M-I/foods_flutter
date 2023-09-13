import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/values/export/export_values.dart';
import '../../../../../../global_widgets/export/export_global_widgets.dart';
import '../../register_controller.dart';

class RegisterFieldsView extends GetView<RegisterController> {
  const RegisterFieldsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NickName
        AppTextFieldWidget(
          controller: controller.state().nickNameController,
          hintText: AppStrings.nickName.tr,
        ),

        // Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin08,
        ),

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
