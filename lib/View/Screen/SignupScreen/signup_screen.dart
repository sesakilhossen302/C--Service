import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../Core/AppRoute/app_route.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignupController();
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
        child: SingleChildScrollView(
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
                StaticString.signupTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                StaticString.signupSubTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLightGrey,
                ),
              ),

              const SizedBox(height: 32),

              // Field 1: Full Name Label
              const Text(
                StaticString.fullNameLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),

              // Full Name Input Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: StaticString.fullNameHint,
                    hintStyle: TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 2: Mobile Number Label
              const Text(
                StaticString.mobileLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),

              // Mobile Input Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: StaticString.mobileHint,
                    hintStyle: TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 3: Password Label
              const Text(
                StaticString.passwordLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),

              // Password Input Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.passwordController,
                  obscureText: !_controller.isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: StaticString.passwordSignupHint,
                    hintStyle: const TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _controller.isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textLightGrey,
                        size: 20,
                      ),
                      onPressed: () {
                        _controller.togglePasswordVisibility(() {
                          setState(() {});
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Terms and Privacy Policy Text
              RichText(
                text: TextSpan(
                  text: StaticString.signupTermsText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textLightGrey,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: StaticString.termsLink,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _controller.onTermsPressed,
                    ),
                    const TextSpan(
                      text: StaticString.andText,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLightGrey,
                      ),
                    ),
                    TextSpan(
                      text: StaticString.privacyLink,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _controller.onPrivacyPressed,
                    ),
                    const TextSpan(
                      text: StaticString.acceptText,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLightGrey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Send OTP Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _controller.onSendOtpPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    StaticString.sendOtp,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Already have account? Login link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: StaticString.alreadyHaveAccount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.login,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoute.loginScreen);
                          },
                      ),
                    ],
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
}
