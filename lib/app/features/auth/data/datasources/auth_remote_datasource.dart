import 'package:foods_rouni/app/features/auth/data/models/remote/request/register_request_dto.dart';

import '../../../../core/error/export_error.dart';
import '../../../../core/network/api_provider.dart';
import '../../../../core/network/models/network_response.dart';
import '../../../../core/values/export/export_values.dart';
import '../models/remote/request/login_request_dto.dart';
import '../models/remote/response/login_response_dto.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseDto?> login({
    required LoginRequestDto data,
  });

  Future<void> register({
    required RegisterRequestDto data,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<LoginResponseDto?> login({
    required LoginRequestDto data,
  }) async {
    LoginResponseDto? result;

    await ApiProvider.post(
      token: AppConstants.emptyString,
      url: AppUrls.login(),
      data: data.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<LoginResponseDto>(
          data,
          LoginResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }

  @override
  Future<void> register({
    required RegisterRequestDto data,
  }) async {
    await ApiProvider.post(
      token: AppConstants.emptyString,
      url: AppUrls.register(),
      data: data.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson(
          data,
          null,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );
  }
}
