import 'package:flutter/material.dart';

class OtpController {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    6,
    (_) => FocusNode(),
  );

  void onOtpChanged(String value, int index, BuildContext context) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void onResendOtpPressed() {
    // Handle resend OTP code
  }

  void onVerifyPressed(BuildContext context) {
    // Handle verify OTP code
  }

  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}
