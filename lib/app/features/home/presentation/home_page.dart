import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/export/export_values.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.black01,
        ),
      ),
    );
  }
}
