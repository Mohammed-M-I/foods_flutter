import 'package:flutter/material.dart';

class LoginUiState {
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  final bool isLoading;

  LoginUiState({
    required this.phoneNumberController,
    required this.passwordController,
    required this.isLoading,
  });

  LoginUiState.defaultObj()
      : this(
    phoneNumberController: TextEditingController(
      text: '',
    ),
    passwordController: TextEditingController(
      text: '',
    ),
    isLoading: false,
  );

  LoginUiState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    bool? isLoading,
  }) =>
      LoginUiState(
        phoneNumberController: phoneNumberController ?? this.phoneNumberController,
        passwordController: passwordController ?? this.passwordController,
        isLoading: isLoading ?? this.isLoading,
      );
}
