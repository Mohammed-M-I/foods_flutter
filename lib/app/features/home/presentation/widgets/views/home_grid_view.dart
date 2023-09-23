import 'package:flutter/material.dart';
import 'package:foods_rouni/app/core/values/export/export_values.dart';
import 'package:foods_rouni/app/features/home/presentation/routing/home_rouing.dart';
import 'package:get/get.dart';

import '../../../../categories/domain/entities/category.dart';
import '../../../../categories/presentation/widgets/category_widget.dart';
import '../../home_controller.dart';
import '../../ui/home_ui_event.dart';

class HomeGridView extends GetView<HomeController> {
  const HomeGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemWidth = 150;
    int screenWidth = Get.width.toInt();
    int count = screenWidth ~/ itemWidth;

    return GridView.builder(
      padding: const EdgeInsetsDirectional.all(
        AppDimensions.paddingOrMargin08,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        mainAxisSpacing: AppDimensions.paddingOrMargin08,
        crossAxisSpacing: AppDimensions.paddingOrMargin08,
      ),
      scrollDirection: Axis.vertical,
      itemCount: controller.state().categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryWidget(
          category: controller.state().categories[index],
          onTap: (Category category) {
            HomeRouting.toProducts(
              categoryId: category.id,
            );
          },
        );
      },
    );
  }
}
