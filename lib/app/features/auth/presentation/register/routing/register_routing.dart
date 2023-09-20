import 'package:foods_rouni/app/core/utils/app_routing_utils.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';

abstract class RegisterRouting {
  static void toMain() {
    AppRoutingUtils.offAllNamed(
      AppRoutes.main,
    );
  }
}
