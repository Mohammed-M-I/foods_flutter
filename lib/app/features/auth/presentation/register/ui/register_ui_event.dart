abstract class RegisterUiEvent {
  factory RegisterUiEvent.register({
    required String nickName,
    required String phoneNumber,
    required String password,
  }) = RegisterEvent;

  factory RegisterUiEvent.login({
    required String phoneNumber,
    required String password,
  }) = LoginEvent;
}

class RegisterEvent implements RegisterUiEvent {
  final String nickName;
  final String phoneNumber;
  final String password;

  RegisterEvent({
    required this.nickName,
    required this.phoneNumber,
    required this.password,
  });
}

class LoginEvent implements RegisterUiEvent {
  final String phoneNumber;
  final String password;

  LoginEvent({
    required this.phoneNumber,
    required this.password,
  });
}
