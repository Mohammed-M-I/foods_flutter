import 'package:flutter/material.dart';
import 'package:foods_rouni/app/core/extensions/strings_extensions.dart';
import 'package:foods_rouni/app/core/values/export/export_values.dart';

import '../../../../global_widgets/app_image_widget.dart';
import '../../../../global_widgets/app_overlay_widget.dart';
import '../../domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final void Function(Product) onTap;

  const ProductWidget({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryRipple,
      borderRadius: BorderRadius.circular(
        AppDimensions.radius10,
      ),
      onTap: () {
        onTap(product);
      },
      child: SizedBox(
        height: AppDimensions.height150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius10,
          ),
          child: Stack(
            children: [
              // Image
              AppImageWidget(
                url: product.image.toUrl,
              ),

              // Overlay
              const AppOverlayWidget(),

              // Info
              Positioned(
                left: AppDimensions.zero,
                right: AppDimensions.zero,
                bottom: AppDimensions.zero,
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.paddingOrMargin16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: AppColors.white01,
                          fontSize: AppDimensions.fontSize12,
                        ),
                        maxLines: 1,
                      ),

                      Row(
                        children: [
                          // Store name
                          Expanded(
                            child: Text(
                              product.storeName,
                              style: const TextStyle(
                                color: AppColors.white01,
                                fontSize: AppDimensions.fontSize12,
                              ),
                              maxLines: 1,
                            ),
                          ),

                          // Price
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              color: AppColors.white01,
                              fontSize: AppDimensions.fontSize12,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
