import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/export/export_values.dart';
import 'login_controller.dart';
import 'ui/login_ui_event.dart';
import 'widgets/views/login_fields_view.dart';
import 'widgets/views/login_logo_view.dart';
import 'widgets/views/login_submit_view.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.paddingOrMargin16,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                const LoginLogoView(),

                // Fields
                const LoginFieldsView(),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Submit
                const LoginSubmitView(),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin40,
                ),

                // To register
                InkWell(
                  onTap: () {
                    controller.on(
                      event: LoginUiEvent.toRegister(),
                    );
                  },
                  child: Text(
                    AppStrings.iDoNotHaveAnAccount.tr,
                    style: const TextStyle(
                      color: AppColors.black01,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
