import 'package:flutter/material.dart';
import 'package:foods_rouni/app/core/extensions/strings_extensions.dart';

import '../../../../core/values/export/export_values.dart';
import '../../../../global_widgets/app_image_widget.dart';
import '../../../../global_widgets/app_overlay_widget.dart';
import '../../domain/entities/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final void Function(Category) onTap;

  const CategoryWidget({
    Key? key,
    required this.category,
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
        onTap(category);
      },
      child: Container(
        height: AppDimensions.height200,
        padding: const EdgeInsetsDirectional.only(
          start: AppDimensions.zero,
          end: AppDimensions.zero,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius10,
          ),
          child: Stack(
            children: [
              // Image
              AppImageWidget(
                url: category.image.toUrl,
              ),

              // Overlay
              const AppOverlayWidget(),

              // Name
              PositionedDirectional(
                start: AppDimensions.paddingOrMargin16,
                end: AppDimensions.paddingOrMargin16,
                bottom: AppDimensions.paddingOrMargin16,
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: AppColors.white01,
                    fontSize: AppDimensions.fontSize16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
