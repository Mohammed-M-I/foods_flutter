import 'package:flutter/material.dart';
import 'package:foods_rouni/app/features/home/presentation/home_controller.dart';
import 'package:get/get.dart';

import '../../../global_widgets/app_no_data_found_widget.dart';
import '../../../global_widgets/app_progress_widget.dart';
import 'widgets/views/home_grid_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // List or no data found
              controller.state().categories.isEmpty
                  ? controller.state().isLoading
                      ? const SizedBox.shrink()
                      : const AppNoDataFoundWidget()
                  : const Expanded(
                      child: HomeGridView(),
                    ),

              // Loading
              if (controller.state().isLoading && controller.state().categories.isEmpty)
                const Center(
                  child: AppProgressWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
