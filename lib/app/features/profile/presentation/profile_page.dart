import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/storage/app_storage.dart';
import '../../../core/values/export/export_values.dart';
import '../../../routes/app_pages.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.black01,
        child: Center(
          child: TextButton(
            onPressed: () {
              AppStorage.removeAll();

              Get.offNamed(
                AppRoutes.splash,
              );
            },
            child: Text(
              'Logout',
            ),
          ),
        ),
      ),
    );
  }
}
