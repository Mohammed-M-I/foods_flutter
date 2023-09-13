class LoginRequestDto {
  final String phoneNumber;
  final String password;

  LoginRequestDto({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
