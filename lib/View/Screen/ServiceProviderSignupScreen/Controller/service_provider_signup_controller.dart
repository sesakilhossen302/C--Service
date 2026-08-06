import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class ServiceProviderSignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController(text: '৳ ২,০০০');
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final selectedExpertise = <String>{'ক্লিনিং'}.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleExpertise(String expertise) {
    if (selectedExpertise.contains(expertise)) {
      selectedExpertise.remove(expertise);
    } else {
      selectedExpertise.add(expertise);
    }
  }

  void onSendOtpPressed() {
    // Navigates to Customer NavBar Screen as requested by user
    Get.offAllNamed(AppRoute.otpScreen);
  }

  void onSeeMorePressed() {
    // Show more expertise options modal/sheet
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    priceController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
