import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),

              // Top Row with Back Button
              const CustomBackButton(),

              SizedBox(height: 28.h),

              // Title
              Text(
                StaticString.createAccountTitle,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),

              SizedBox(height: 6.h),

              // Subtitle
              Text(
                StaticString.createAccountSub,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF94A3B8),
                ),
              ),

              SizedBox(height: 28.h),

              // 1. Full Name Label & Input Field
              Text(
                StaticString.fullNameLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.nameController,
                style: TextStyle(fontSize: 14.5.sp, color: const Color(0xFF1E293B)),
                decoration: _buildInputDecoration(StaticString.fullNameHint),
              ),

              SizedBox(height: 18.h),

              // 2. Phone Number Label & Input Field
              Text(
                StaticString.phoneLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14.5.sp, color: const Color(0xFF1E293B)),
                decoration: _buildInputDecoration(StaticString.phoneHint),
              ),

              SizedBox(height: 18.h),

              // 3. Password Label & Input Field
              Text(
                StaticString.passwordLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  style: TextStyle(fontSize: 14.5.sp, color: const Color(0xFF1E293B)),
                  decoration: _buildInputDecoration(
                    StaticString.passwordSignupHint,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF94A3B8),
                        size: 20.sp,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              // Terms & Privacy Notice directly below Password Field
              RichText(
                text: TextSpan(
                  text: StaticString.termsPrefix,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: const Color(0xFF94A3B8),
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: StaticString.termsLink,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = controller.onTermsPressed,
                    ),
                    TextSpan(
                      text: StaticString.andText,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                    TextSpan(
                      text: StaticString.privacyLink,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = controller.onPrivacyPressed,
                    ),
                    TextSpan(
                      text: StaticString.acceptText,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48.h),

              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.onSendOtpPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    StaticString.sendOtp,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Bottom Link: Already have an account? Login
              Center(
                child: GestureDetector(
                  onTap: controller.onLoginPressed,
                  child: RichText(
                    text: TextSpan(
                      text: StaticString.alreadyHaveAccount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF64748B),
                      ),
                      children: [
                        TextSpan(
                          text: StaticString.login,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: const Color(0xFFCBD5E1),
        fontSize: 14.sp,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
