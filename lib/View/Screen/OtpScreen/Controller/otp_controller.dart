import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class OtpController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void onResendOtpPressed() {
    // Handle resend OTP code
  }

  void onVerifyPressed() {
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    final bool fromCustomerSignup = args?['fromCustomerSignup'] ?? false;

    if (fromCustomerSignup) {
      // From Customer Signup -> OTP -> navigate to Service Provider Signup page
      Get.toNamed(AppRoute.customerHomeScreen);
    } else {
      // Direct -> navigate to Customer HomeScreen
      Get.offAllNamed(AppRoute.serviceProviderSignupScreen);
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
