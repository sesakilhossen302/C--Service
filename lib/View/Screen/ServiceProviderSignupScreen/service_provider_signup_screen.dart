import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/service_provider_signup_controller.dart';

class ServiceProviderSignupScreen extends StatelessWidget {
  const ServiceProviderSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceProviderSignupController());

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

              SizedBox(height: 28.h),

              // Title
              Text(
                StaticString.providerSignupTitle,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 6.h),

              // Subtitle
              Text(
                StaticString.providerSignupSub,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  color: AppColors.textGrey,
                ),
              ),

              SizedBox(height: 28.h),

              // 1. Full Name Label & Field
              Text(
                StaticString.nameLabel,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 6.h),
              TextField(
                controller: controller.nameController,
                style: TextStyle(fontSize: 14.sp),
                decoration: _buildInputDecoration(StaticString.nameHint),
              ),

              SizedBox(height: 16.h),

              // 2. Phone Number Label & Field
              Text(
                StaticString.phoneLabel,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 6.h),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14.sp),
                decoration: _buildInputDecoration(StaticString.phoneHint),
              ),

              SizedBox(height: 16.h),

              // 3. Expertise Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StaticString.expertiseLabel,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.onSeeMorePressed,
                    child: Text(
                      StaticString.seeMore,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // Expertise Choice Chips Grid/Wrap
              Obx(
                () => Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    _buildExpertiseChip('ক্লিনিং', controller),
                    _buildExpertiseChip('এসি সার্ভিস', controller),
                    _buildExpertiseChip('ইলেকট্রিশিয়ান', controller),
                    _buildExpertiseChip('প্লাম্বিং', controller),
                    _buildExpertiseChip('প্যাস্ট কন্ট্রোল', controller),
                    _buildExpertiseChip('রান্না', controller),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // 4. Starting Hourly Rate Label & Field
              Text(
                StaticString.hourlyRateLabel,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 6.h),
              TextField(
                controller: controller.priceController,
                style: TextStyle(fontSize: 14.sp),
                decoration: _buildInputDecoration('৳ ২,০০০'),
              ),

              SizedBox(height: 16.h),

              // 5. Password Label & Field
              Text(
                StaticString.passwordLabel,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  style: TextStyle(fontSize: 14.sp),
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

              SizedBox(height: 28.h),

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

              SizedBox(height: 20.h),

              // Terms Footer
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: StaticString.termsPrefix,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textGrey,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.termsLink,
                        style: TextStyle(
                          fontSize: 12.sp,
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

  Widget _buildExpertiseChip(String label, ServiceProviderSignupController controller) {
    final isSelected = controller.selectedExpertise.contains(label);
    return GestureDetector(
      onTap: () => controller.toggleExpertise(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.cardBorder,
            width: 1.w,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.5.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textColor,
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
        fontSize: 13.5.sp,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
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
