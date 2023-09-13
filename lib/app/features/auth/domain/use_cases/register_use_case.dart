import 'package:dartz/dartz.dart';

import '../../../../core/error/export_error.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<void, Params> {
  final AuthRepository _repository;

  RegisterUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.register(
      nickName: params.nickName,
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class Params {
  final String nickName;
  final String phoneNumber;
  final String password;

  Params({
    required this.nickName,
    required this.phoneNumber,
    required this.password,
  });
}
