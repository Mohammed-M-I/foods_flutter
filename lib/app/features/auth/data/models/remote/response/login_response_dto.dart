import '../../../../domain/entities/login_data.dart';

class LoginResponseDto extends LoginData {
  LoginResponseDto({
    required super.id,
    required super.nickName,
    required super.phoneNumber,
    required super.token,
  });

  factory LoginResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      LoginResponseDto(
        id: json['id'],
        nickName: json['nickName'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
      );
}
