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
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              // Top Row with Back Button
              const CustomBackButton(),

              SizedBox(height: 32.h),

              // Title
              Text(
                StaticString.createAccountTitle,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                StaticString.createAccountSub,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textGrey,
                ),
              ),

              SizedBox(height: 32.h),

              // 1. Full Name Label & Input Field
              Text(
                StaticString.nameLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.nameController,
                style: TextStyle(fontSize: 14.5.sp),
                decoration: _buildInputDecoration(StaticString.nameHint),
              ),

              SizedBox(height: 20.h),

              // 2. Phone Number Label & Input Field
              Text(
                StaticString.phoneLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14.5.sp),
                decoration: _buildInputDecoration(StaticString.phoneHint),
              ),

              SizedBox(height: 20.h),

              // 3. Password Label & Input Field
              Text(
                StaticString.passwordLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  style: TextStyle(fontSize: 14.5.sp),
                  decoration: _buildInputDecoration(
                    StaticString.passwordHint,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textLightGrey,
                        size: 20.sp,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32.h),

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
                      borderRadius: BorderRadius.circular(16.r),
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

              SizedBox(height: 24.h),

              // Terms Footer
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: StaticString.termsPrefix,
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      color: AppColors.textGrey,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.termsLink,
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),
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
        color: AppColors.textLightGrey,
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
        borderSide: const BorderSide(color: AppColors.cardBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: AppColors.cardBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
