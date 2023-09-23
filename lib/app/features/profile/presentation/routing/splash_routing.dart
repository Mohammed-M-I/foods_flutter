import 'package:foods_rouni/app/core/utils/app_routing_utils.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';

abstract class ProfileRouting {
  static void toSplash() {
    AppRoutingUtils.offNamed(
      AppRoutes.splash,
    );
  }
}
