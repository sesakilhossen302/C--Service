import 'package:flutter/material.dart';
import '../../../../Core/AppRoute/app_route.dart';

class LoginController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility(VoidCallback updateState) {
    isPasswordVisible = !isPasswordVisible;
    updateState();
  }

  void onLoginPressed(BuildContext context) {
    // Handle login API request
  }

  void onForgotPasswordPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.forgotPasswordScreen);
  }

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
  }
}
