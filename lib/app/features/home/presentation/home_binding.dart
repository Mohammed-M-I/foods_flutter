import 'package:get/get.dart';

import '../../categories/data/datasources/categories_local_datasource.dart';
import '../../categories/data/datasources/categories_remote_datasource.dart';
import '../../categories/data/repositories/categories_repository_impl.dart';
import '../../categories/domain/use_cases/store_categories_get_filtered_use_case.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final categoriesRepository = CategoriesRepositoryImpl(
      remoteDatasource: CategoriesRemoteDatasourceImpl(),
      localDatasource: CategoriesLocalDatasourceImpl(),
    );

    final storeCategoriesGetFilteredUseCase = StoreCategoriesGetFilteredUseCase(
      repository: categoriesRepository,
    );

    Get.put(
      HomeController(
        storeCategoriesGetFilteredUseCase: storeCategoriesGetFilteredUseCase,
      ),
    );
  }
}
