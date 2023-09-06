import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/values/app_strings.dart';
import '../../../../../../global_widgets/export/export_global_widgets.dart';
import '../../login_controller.dart';
import '../../ui/login_ui_event.dart';

class LoginSubmitView extends GetView<LoginController> {
  const LoginSubmitView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state().isLoading
          ? const AppProgressWidget()
          : IntrinsicWidth(
              stepWidth: double.infinity,
              child: AppButtonWidget(
                text: AppStrings.login.tr,
                onPressed: () {
                  controller.on(
                    event: LoginUiEvent.login(
                      phoneNumber: controller.state().phoneNumberController.text,
                      password: controller.state().passwordController.text,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
