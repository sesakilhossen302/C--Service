import 'package:flutter/material.dart';

class LoginController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility(VoidCallback updateState) {
    isPasswordVisible = !isPasswordVisible;
    updateState();
  }

  void onLoginPressed() {
    // Handle login API request
  }

  void onForgotPasswordPressed() {
    // Handle forgot password action
  }

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
  }
}
