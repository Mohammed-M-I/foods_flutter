import '../../../../core/storage/app_storage.dart';
import '../../domain/entities/login_data.dart';

abstract class AuthUserUtils {
  static Future<void> saveLoginData({
    required LoginData loginData,
  }) async =>
      AppStorage.write(
        AppStorage.loginData,
        loginData.toJson(),
      );

  static LoginData? get _loginData {
    final encodedData = AppStorage.read<Map<String, dynamic>?>(
      AppStorage.loginData,
      null,
    );

    if (encodedData == null) {
      return null;
    }

    return LoginData.fromJson(
      encodedData,
    );
  }

  static String get id => _loginData?.id ?? '';

  static String get nickName => _loginData?.nickName ?? '';

  static String get phoneNumber => _loginData?.phoneNumber ?? '';

  static String get token => _loginData?.token ?? '';
}
