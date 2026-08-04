import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/otp_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final OtpController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OtpController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Custom Circular Back Button
              const CustomBackButton(),

              const SizedBox(height: 32),

              // Header Title & Subtitle
              const Text(
                StaticString.otpTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                StaticString.otpSubTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLightGrey,
                ),
              ),

              const SizedBox(height: 36),

              // 6 OTP Digit Input Boxes Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return _buildOtpBox(index);
                }),
              ),

              const SizedBox(height: 24),

              // Resend Code Link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: StaticString.didntGetCode,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.resendCode,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _controller.onResendOtpPressed,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Verify Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _controller.onVerifyPressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    StaticString.verify,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Individual OTP Digit Box Widget
  Widget _buildOtpBox(int index) {
    final controller = _controller.otpControllers[index];
    final focusNode = _controller.focusNodes[index];

    return Container(
      width: 48,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: controller.text.isNotEmpty
              ? AppColors.primaryColor
              : AppColors.cardBorder,
          width: 1.2,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            setState(() {});
            _controller.onOtpChanged(value, index, context);
          },
        ),
      ),
    );
  }
}
