import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/app_tab_bar_widget.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.state().selectedIndex,
          children: controller.state().pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => AppTabBarWidget(
          items: controller.state().items,
          selectedIndex: controller.state().selectedIndex,
          onTap: (int index) {
            controller.state(
              controller.state().copyWith(
                    selectedIndex: index,
                  ),
            );
          },
          isBottomIndicator: false,
        ),
      ),
    );
  }
}
