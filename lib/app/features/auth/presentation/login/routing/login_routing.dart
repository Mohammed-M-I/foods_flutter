import 'package:foods_rouni/app/core/utils/app_routing_utils.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';

abstract class LoginRouting {
  static void toMain() {
    AppRoutingUtils.offNamed(
      AppRoutes.main,
    );
  }

  static void toRegister() {
    AppRoutingUtils.toNamed(
      AppRoutes.register,
    );
  }
}
