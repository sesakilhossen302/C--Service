import 'package:flutter/material.dart';
import '../../../../Core/AppRoute/app_route.dart';

class ForgotPasswordController {
  final phoneController = TextEditingController();

  void onSendCodePressed(BuildContext context) {
    // Navigate to OTP verification screen
    Navigator.pushNamed(context, AppRoute.otpScreen);
  }

  void dispose() {
    phoneController.dispose();
  }
}
