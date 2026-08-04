import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../Core/AppRoute/app_route.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
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
                StaticString.loginTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                StaticString.loginSubTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLightGrey,
                ),
              ),

              const SizedBox(height: 36),

              // Mobile Number Field Label
              const Text(
                StaticString.mobileLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),

              // Mobile Input Field with +880 Prefix
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: AppColors.cardBorder, width: 1),
                        ),
                      ),
                      child: const Text(
                        StaticString.countryCodeBD,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    Expanded(
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
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Password Field Label
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
                    hintText: StaticString.passwordLoginHint,
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

              const SizedBox(height: 12),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => _controller.onForgotPasswordPressed(context),
                  child: const Text(
                    StaticString.forgotPassword,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Login Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _controller.onLoginPressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    StaticString.login,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Don't have account? Register link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: StaticString.dontHaveAccount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.register,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoute.signupScreen);
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
