import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),

              // Circular Back Button
              const CustomBackButton(),

              SizedBox(height: 28.h),

              // Headline Title
              Text(
                StaticString.loginTitle,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),

              SizedBox(height: 6.h),

              // Subtitle
              Text(
                StaticString.loginSubtitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF94A3B8),
                ),
              ),

              SizedBox(height: 28.h),

              // Phone Number Label & Input Field
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
                decoration: _buildInputDecoration(
                  StaticString.phoneHint,
                  prefixIcon: Container(
                    width: 72.w,
                    height: 52.h,
                    margin: EdgeInsets.only(right: 12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAF8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                      border: const Border(
                        right: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      StaticString.countryCodeBD,
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // Password Label & Input Field
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
                    StaticString.passwordLoginHint,
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

              // Forgot Password Right-aligned Link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: controller.onForgotPasswordPressed,
                  child: Text(
                    StaticString.forgotPasswordLink,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 160.h),

              // Login Button (Filled Green)
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.onLoginPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    StaticString.login,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Bottom Signup Prompt
              Center(
                child: GestureDetector(
                  onTap: controller.onRegisterPressed,
                  child: RichText(
                    text: TextSpan(
                      text: StaticString.dontHaveAccount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF64748B),
                      ),
                      children: [
                        TextSpan(
                          text: StaticString.register,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
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

  InputDecoration _buildInputDecoration(
    String hint, {
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
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
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIcon != null
          ? BoxConstraints(
              minWidth: 72.w,
              minHeight: 52.h,
            )
          : null,
      suffixIcon: suffixIcon,
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
    );
  }
}
