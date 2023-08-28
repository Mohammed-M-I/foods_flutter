import 'package:flutter/material.dart';
import '../values/export/export_values.dart';
import 'package:get/get.dart';

abstract class AppAlertUtils {
  static void showSnackBar({
    required String title,
    required  String message,
    Color backgroundColor = AppColors.primary,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    int durationSeconds = 5,
  }) {
    Get.snackbar(
      title,
      message,
      duration: Duration(
        seconds: durationSeconds,
      ),
      borderRadius: AppDimensions.radius10,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(
        AppDimensions.paddingOrMargin08,
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize14,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize16,
          color: AppColors.white,
        ),
      ),
    );
  }


}
