import 'package:flutter/material.dart';
import '../core/values/app_strings.dart';
import 'package:get/get.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  const AppNoDataFoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noDataFound.tr,
      ),
    );
  }
}
