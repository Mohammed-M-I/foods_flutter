import 'package:flutter/widgets.dart';

class RegisterUiState {
  final TextEditingController nickNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  final bool isLoading;

  RegisterUiState({
    required this.nickNameController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.isLoading,
  });

  RegisterUiState.defaultObj()
      : this(
          nickNameController: TextEditingController(),
          phoneNumberController: TextEditingController(),
          passwordController: TextEditingController(),
          isLoading: false,
        );

  RegisterUiState copyWith({
    TextEditingController? nickNameController,
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    bool? isLoading,
  }) =>
      RegisterUiState(
        nickNameController: nickNameController ?? this.nickNameController,
        phoneNumberController: phoneNumberController ?? this.phoneNumberController,
        passwordController: passwordController ?? this.passwordController,
        isLoading: isLoading ?? this.isLoading,
      );
}
