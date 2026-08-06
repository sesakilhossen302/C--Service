import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class ForgotPasswordController extends GetxController {
  final phoneController = TextEditingController();

  void onSendCodePressed() {
    Get.toNamed(AppRoute.otpScreen);
  }

  void onSendOtpPressed() {
    onSendCodePressed();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
