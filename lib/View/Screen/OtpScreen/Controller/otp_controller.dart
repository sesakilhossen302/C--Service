import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class OtpController extends GetxController {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  void onResendOtpPressed() {
    // Handle resend OTP code
    pinController.clear();
  }

  void onVerifyPressed() {
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    final String role = args?['role'] ?? (args?['fromCustomerSignup'] == true ? 'customer_signup' : 'customer_home');

    if (role == 'customer_signup') {
      // From Customer Signup -> OTP -> navigate to Service Provider Signup page
      Get.toNamed(AppRoute.serviceProviderSignupScreen);
    } else if (role == 'provider_signup') {
      // From Service Provider Signup -> OTP -> navigate to Provider NavBar Screen
      Get.offAllNamed(AppRoute.providerNavBarScreen);
    } else {
      // Direct -> navigate to Customer NavBar Screen
      Get.offAllNamed(AppRoute.customerNavBarScreen);
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
