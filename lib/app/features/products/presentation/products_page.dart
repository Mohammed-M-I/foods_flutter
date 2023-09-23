import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/app_no_data_found_widget.dart';
import '../../../global_widgets/app_progress_widget.dart';
import 'products_controller.dart';
import 'widgets/views/products_list_view.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({
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
              controller.state().products.isEmpty
                  ? controller.state().isLoading
                      ? const SizedBox.shrink()
                      : const AppNoDataFoundWidget()
                  : const Expanded(
                      child: ProductsListView(),
                    ),

              // Loading at first time
              if (controller.state().isLoading && controller.state().products.isEmpty)
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
