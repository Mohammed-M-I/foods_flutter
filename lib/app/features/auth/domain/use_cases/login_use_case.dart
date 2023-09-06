import 'package:dartz/dartz.dart';

import '../../../../core/error/export_error.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/login_data.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<LoginData, Params> {
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, LoginData>> call(Params params) {
    return _repository.login(
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class Params {
  final String phoneNumber;
  final String password;

  Params({
    required this.phoneNumber,
    required this.password,
  });
}
