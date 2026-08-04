import 'package:flutter/material.dart';
import '../../../../Core/AppRoute/app_route.dart';

class ServiceProviderSignupController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController(text: '৳ ২,০০০');
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  final Set<String> selectedExpertise = {'ক্লিনিং'};

  void togglePasswordVisibility(VoidCallback updateState) {
    isPasswordVisible = !isPasswordVisible;
    updateState();
  }

  void toggleExpertise(String expertise, VoidCallback updateState) {
    if (selectedExpertise.contains(expertise)) {
      selectedExpertise.remove(expertise);
    } else {
      selectedExpertise.add(expertise);
    }
    updateState();
  }

  void onSendOtpPressed(BuildContext context) {
    // Navigate to OTP page
    Navigator.pushNamed(context, AppRoute.otpScreen, arguments: {'isServiceProvider': true});
  }

  void onSeeMorePressed() {
    // Show more expertise options modal/sheet
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    priceController.dispose();
    passwordController.dispose();
  }
}
