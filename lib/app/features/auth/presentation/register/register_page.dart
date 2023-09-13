import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/export/export_values.dart';
import 'register_controller.dart';
import 'widgets/views/regsiter_fields_view.dart';
import 'widgets/views/regsiter_logo_view.dart';
import 'widgets/views/regsiter_submit_view.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({
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
              children: const [
                // Header
                RegisterLogoView(),

                // Fields
                RegisterFieldsView(),

                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Submit
                RegisterSubmitView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
