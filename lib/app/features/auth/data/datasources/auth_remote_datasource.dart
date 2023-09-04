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
}
