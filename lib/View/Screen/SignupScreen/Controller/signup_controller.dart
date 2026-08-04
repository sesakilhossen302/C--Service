import 'package:flutter/material.dart';

class SignupController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility(VoidCallback updateState) {
    isPasswordVisible = !isPasswordVisible;
    updateState();
  }

  void onSendOtpPressed() {
    // Handle OTP sending API call
  }

  void onTermsPressed() {
    // Open terms and conditions page
  }

  void onPrivacyPressed() {
    // Open privacy policy page
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
