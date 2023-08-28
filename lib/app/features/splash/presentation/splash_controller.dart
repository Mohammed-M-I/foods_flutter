import 'package:get/get.dart';

import '../../../core/storage/app_storage.dart';
import '../../../core/values/export/export_values.dart';
import '../../../features/splash/presentation/ui/splash_ui_event.dart';
import '../../../routes/app_pages.dart';
import 'ui/splash_ui_state.dart';

class SplashController extends GetxController {
  //region State

  final state = SplashUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  SplashController();

  //endregion Constructors

  //region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();

    on(
      event: SplashUiEvent.delayTimeout(),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  //endregion Lifecycle

  //region Public functions

  void on({
    required SplashUiEvent event,
  }) {
    if (event is DelayTimeoutEvent) {
      _delayTimeout(
        event: event,
      );

      return;
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _delayTimeout({
    required DelayTimeoutEvent event,
  }) {
    Future.delayed(
      const Duration(
        seconds: AppConstants.splashDelay,
      ),
      () {
        final isLoggedIn = AppStorage.read<bool>(
          AppStorage.isLoggedIn,
          false,
        );

        if (isLoggedIn) {
          Get.offNamed(
            AppRoutes.main,
          );
        } else {
          Get.offNamed(
            AppRoutes.login,
          );
        }
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
