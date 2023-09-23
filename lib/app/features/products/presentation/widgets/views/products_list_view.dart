import 'package:flutter/material.dart';
import 'package:foods_rouni/app/core/values/export/export_values.dart';
import 'package:foods_rouni/app/global_widgets/export/export_global_widgets.dart';
import 'package:get/get.dart';

import '../../../domain/entities/product.dart';
import '../../products_controller.dart';
import '../product_widget.dart';

class ProductsListView extends GetView<ProductsController> {
  const ProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingOrMargin16,
          vertical: AppDimensions.paddingOrMargin16,
        ),
        scrollDirection: Axis.vertical,
        controller: controller.state().scrollController,
        itemCount: controller.state().products.length + (controller.state().isLoading || controller.state().pagedList.nextPage == -1 ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (controller.state().isLoading && index == controller.state().products.length) {
            return const Center(
              child: AppProgressWidget(),
            );
          }

          if (controller.state().pagedList.nextPage == -1 && index == controller.state().products.length) {
            return const Center(
              child: Text(
                'No More Data',
              ),
            );
          }

          return ProductWidget(
            product: controller.state().products[index],
            onTap: (Product product) {

            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: AppDimensions.paddingOrMargin16,
          );
        },
      ),
    );
  }
}
