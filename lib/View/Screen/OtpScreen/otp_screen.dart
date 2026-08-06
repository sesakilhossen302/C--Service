import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());

    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 54.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.cardBorder, width: 1.w),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primaryColor, width: 1.8.w),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.primaryColor.withAlpha(15),
        border: Border.all(color: AppColors.primaryColor, width: 1.w),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              // Back Button
              const CustomBackButton(),

              SizedBox(height: 32.h),

              // Title
              Text(
                StaticString.otpTitle,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                StaticString.otpSub,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textGrey,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 36.h),

              // Pinput Widget (6 Digits with native Copy-Paste and AutoFill)
              Center(
                child: Pinput(
                  length: 6,
                  controller: controller.pinController,
                  focusNode: controller.focusNode,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  separatorBuilder: (index) => SizedBox(width: 8.w),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) => controller.onVerifyPressed(),
                ),
              ),

              SizedBox(height: 36.h),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.onVerifyPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    StaticString.verify,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 28.h),

              // Resend OTP Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StaticString.didntGetCode,
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: controller.onResendOtpPressed,
                      child: Text(
                        StaticString.resendCode,
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
