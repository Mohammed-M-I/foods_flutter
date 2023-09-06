class RegisterRequestDto {
  final String nickName;
  final String phoneNumber;
  final String password;

  RegisterRequestDto({
    required this.nickName,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nickName': nickName,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
