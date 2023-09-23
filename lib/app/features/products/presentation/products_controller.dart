import 'package:foods_rouni/app/core/data/data_state.dart';
import 'package:foods_rouni/app/core/values/export/export_values.dart';
import 'package:get/get.dart';

import '../../../core/error/failures.dart';
import '../../../core/utils/app_alert_utils.dart';
import '../../../core/values/constants/app_arguments_keys.dart';
import '../domain/entities/product.dart';
import '../domain/use_cases/store_products_get_filtered_use_case.dart';
import 'ui/products_ui_event.dart';
import 'ui/products_ui_state.dart';

class ProductsController extends GetxController {
//region State

  final state = ProductsUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final StoreProductsGetFilteredUseCase _storeProductsGetFilteredUseCase;

  //endregion Use Cases

  //region Constructors

  ProductsController({
    required StoreProductsGetFilteredUseCase storeProductsGetFilteredUseCase,
  }) : _storeProductsGetFilteredUseCase = storeProductsGetFilteredUseCase;

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

    state().scrollController.addListener(
      () {
        if (state().scrollController.position.pixels == state().scrollController.position.maxScrollExtent) {
          if (state().pagedList.nextPage != -1 && !state().isLoading) {
            on(
              event: ProductsUiEvent.getAll(
                pageSize: state().pagedList.pageSize,
                pageNumber: state().pagedList.nextPage,
                search: state().search,
                withPaging: state().pagedList.withPaging,
                categoryId: state().categoryId,
              ),
            );
          }
        }
      },
    );

    on(
      event: ProductsUiEvent.getAll(
        pageSize: state().pagedList.pageSize,
        pageNumber: state().pagedList.pageNumber,
        search: state().search,
        withPaging: state().pagedList.withPaging,
        categoryId: state().categoryId,
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
    required ProductsUiEvent event,
  }) {
    if (event is GetAllEvent) {
      _getAllEvent(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _getAllEvent({
    required GetAllEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    // state().scrollController.animateTo(
    //   state().scrollController.position.maxScrollExtent,
    //   duration: const Duration(
    //     milliseconds: 50,
    //   ),
    //   curve: Curves.easeInOut,
    // );

    // await Future.delayed(
    //   const Duration(
    //     seconds: 3,
    //   ),
    // );

    final result = await _storeProductsGetFilteredUseCase.call(
      Params(
        pageSize: event.pageSize,
        pageNumber: event.pageNumber,
        search: event.search,
        withPaging: event.withPaging,
        categoryId: event.categoryId,
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
      (DataState<List<Product>> dataState) async {
        if (dataState is DoneState) {
          final newDataList = state().products;
          newDataList.addAll(
            dataState.data,
          );

          state(
            state().copyWith(
              products: newDataList,
              pagedList: dataState.pagedList,
              isLoading: false,
            ),
          );
        }
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {
    if (Get.arguments != null) {
      if (Get.arguments[AppArgumentsKeys.categoryId] != null) {
        state(
          state().copyWith(
            categoryId: Get.arguments[AppArgumentsKeys.categoryId],
          ),
        );
      }
    }
  }

//endregion Private functions

}
