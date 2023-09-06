import 'package:dartz/dartz.dart';
import '../../../../core/error/export_error.dart';
import '../../../../core/network/utils/app_network_utils.dart';
import '../../domain/entities/login_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/remote/request/login_request_dto.dart';
import '../models/remote/request/register_request_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.login(
          data: LoginRequestDto(
            phoneNumber: phoneNumber,
            password: password,
          ),
        );

        return Right(
          result!,
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String nickName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        await _remoteDatasource.register(
          data: RegisterRequestDto(
            nickName: nickName,
            phoneNumber: phoneNumber,
            password: password,
          ),
        );

        return const Right(
          null,
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
