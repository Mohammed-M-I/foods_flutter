import 'package:foods_rouni/app/core/utils/app_routing_utils.dart';
import 'package:foods_rouni/app/core/values/constants/app_arguments_keys.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';

abstract class HomeRouting {
  static void toProducts({
    required int categoryId,
  }) {
    AppRoutingUtils.toNamed(
      AppRoutes.products,
      arguments: {
        AppArgumentsKeys.categoryId: categoryId,
      },
    );
  }
}
