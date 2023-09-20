import 'package:foods_rouni/app/core/data/data_state.dart';
import 'package:foods_rouni/app/core/values/export/export_values.dart';
import 'package:foods_rouni/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/error/failures.dart';
import '../../../core/utils/app_alert_utils.dart';
import '../../../core/values/constants/app_arguments_keys.dart';
import '../../categories/domain/entities/category.dart';
import '../../categories/domain/use_cases/store_categories_get_filtered_use_case.dart';
import 'ui/home_ui_event.dart';
import 'ui/home_ui_state.dart';

class HomeController extends GetxController {
//region State

  final state = HomeUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final StoreCategoriesGetFilteredUseCase _storeCategoriesGetFilteredUseCase;

  //endregion Use Cases

  //region Constructors

  HomeController({
    required StoreCategoriesGetFilteredUseCase storeCategoriesGetFilteredUseCase,
  }) : _storeCategoriesGetFilteredUseCase = storeCategoriesGetFilteredUseCase;

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
      event: HomeUiEvent.getCategories(
        pageSize: -1,
        pageNumber: -1,
        search: '',
        withPaging: false,
      ),
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
    required HomeUiEvent event,
  }) {
    if (event is GetCategoriesEvent) {
      _getCategoriesEvent(
        event: event,
      );

      return;
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _getCategoriesEvent({
    required GetCategoriesEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _storeCategoriesGetFilteredUseCase.call(
      Params(
        pageSize: event.pageSize,
        pageNumber: event.pageNumber,
        search: event.search,
        withPaging: event.withPaging,
      ),
    );

    result.fold(
      (Failure failure) {
        AppAlertUtils.showSnackBar(
          title: AppStrings.alertError.tr,
          message: failure.message,
          backgroundColor: AppColors.red,
        );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );
      },
      (DataState<List<Category>> dataState) async {
        if (dataState is DoneState) {
          state(
            state().copyWith(
              categories: dataState.data,
              isLoading: false,
            ),
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
