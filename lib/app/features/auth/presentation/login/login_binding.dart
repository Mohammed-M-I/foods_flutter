import 'package:get/get.dart';

import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepositoryImpl(
      remoteDatasource: AuthRemoteDatasourceImpl(),
    );

    final loginUseCase = LoginUseCase(
      repository: authRepository,
    );

    Get.lazyPut(
      () => LoginController(
        loginUseCase: loginUseCase,
      ),
    );
  }
}
