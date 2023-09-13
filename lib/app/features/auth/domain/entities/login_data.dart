class LoginData {
  final String id;
  final String nickName;
  final String phoneNumber;
  final String token;

  LoginData({
    required this.id,
    required this.nickName,
    required this.phoneNumber,
    required this.token,
  });

  factory LoginData.fromJson(
    Map<String, dynamic> json,
  ) =>
      LoginData(
        id: json['id'],
        nickName: json['nickName'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'nickName': nickName,
        'phoneNumber': phoneNumber,
        'token': token,
      };
}
