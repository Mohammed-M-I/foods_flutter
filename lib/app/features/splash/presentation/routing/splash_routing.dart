import 'package:foods_rouni/app/core/utils/app_routing_utils.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';

abstract class SplashRouting {
  static void toLoginOrMain({
    required bool isLoggedIn,
  }) {
    AppRoutingUtils.offNamed(
      isLoggedIn ? AppRoutes.main : AppRoutes.login,
    );
  }
}
