abstract class LoginUiEvent {
  factory LoginUiEvent.login({
    required String phoneNumber,
    required String password,
  }) = LoginEvent;

  factory LoginUiEvent.toRegister() = ToRegisterEvent;
}

class LoginEvent implements LoginUiEvent {
  final String phoneNumber;
  final String password;

  LoginEvent({
    required this.phoneNumber,
    required this.password,
  });
}

class ToRegisterEvent implements LoginUiEvent {
  ToRegisterEvent();
}
