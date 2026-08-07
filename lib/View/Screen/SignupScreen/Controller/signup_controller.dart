import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void onSendOtpPressed() {
    // Customer signup -> navigate to OTP screen with 'customer_signup' role
    Get.toNamed(
      AppRoute.otpScreen,
      arguments: {'role': 'customer_signup'},
    );
  }

  void onTermsPressed() {
    // Open terms and conditions page
  }

  void onPrivacyPressed() {
    // Open privacy policy page
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
