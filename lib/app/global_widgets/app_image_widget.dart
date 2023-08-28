import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/values/app_dimensions.dart';
import '../core/values/constants/app_assets.dart';

import 'app_progress_widget.dart';

class AppImageWidget extends StatelessWidget {
  final String url;
  final String placeholder;
  final double width;
  final double height;

  const AppImageWidget({
    Key? key,
    required this.url,
    this.placeholder = AppAssets.logo,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (BuildContext context, String url) {
        return const Center(
          child: AppProgressWidget(),
        );
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return Padding(
          padding: const EdgeInsets.all(
            AppDimensions.paddingOrMargin16,
          ),
          child: Image.asset(
            placeholder,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
