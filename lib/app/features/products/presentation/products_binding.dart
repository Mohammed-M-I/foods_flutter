import 'package:get/get.dart';

import '../data/datasources/products_remote_datasource.dart';
import '../data/repositories/products_repository_impl.dart';
import '../domain/use_cases/store_products_get_filtered_use_case.dart';
import 'products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    final categoriesRepository = ProductsRepositoryImpl(
      remoteDatasource: ProductsRemoteDatasourceImpl(),
    );

    final storeProductsGetFilteredUseCase = StoreProductsGetFilteredUseCase(
      repository: categoriesRepository,
    );

    Get.put(
      ProductsController(
        storeProductsGetFilteredUseCase: storeProductsGetFilteredUseCase,
      ),
    );
  }
}
