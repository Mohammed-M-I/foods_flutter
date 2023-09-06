import 'package:dartz/dartz.dart';
import '../../../../core/error/export_error.dart';

import '../entities/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> register({
    required String nickName,
    required String phoneNumber,
    required String password,
  });
}
