import 'package:get/get.dart';

import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepositoryImpl(
      remoteDatasource: AuthRemoteDatasourceImpl(),
    );

    final registerUseCase = RegisterUseCase(
      repository: authRepository,
    );

    final loginUseCase = LoginUseCase(
      repository: authRepository,
    );

    Get.lazyPut(
      () => RegisterController(
        registerUseCase: registerUseCase,
        loginUseCase: loginUseCase,
      ),
    );
  }
}
