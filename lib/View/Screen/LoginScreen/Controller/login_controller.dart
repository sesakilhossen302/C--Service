import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void onLoginPressed() {
    Get.offAllNamed(AppRoute.customerNavBarScreen);
  }

  void onForgotPasswordPressed() {
    Get.toNamed(AppRoute.forgotPasswordScreen);
  }

  void onRegisterPressed() {
    Get.toNamed(AppRoute.signupScreen);
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
