import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/rate_service_controller.dart';

class RateServiceScreen extends StatelessWidget {
  const RateServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RateServiceController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 6.h),

            // 1. Top Header Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: 14.w),
                  Text(
                    'রেটিং দিন',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    // Technician Avatar Container
                    Container(
                      width: 84.w,
                      height: 84.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Text(
                          '👨‍🔧',
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Technician Name & Service
                    Text(
                      'রহিম মিঞা',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      'এসি ক্লিনিং',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.textGrey,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // "সেবা কেমন ছিল?" Star Rating Section
                    Text(
                      'সেবা কেমন ছিল?',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // 5 Stars Row
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final starIndex = index + 1;
                          final isFilled = starIndex <= controller.selectedRating.value;
                          return GestureDetector(
                            onTap: () => controller.setRating(starIndex),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Icon(
                                isFilled ? Icons.star_rounded : Icons.star_outline_rounded,
                                color: isFilled
                                    ? AppColors.primaryColor
                                    : const Color(0xFFD1D5DB),
                                size: 36.sp,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      'তারকা ছুঁয়ে রেট করুন',
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // "কী ভালো লেগেছে?" Feedback Chip Tags Section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'কী ভালো লেগেছে?',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Obx(
                      () => Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: controller.tags.map((tag) {
                            return GestureDetector(
                              onTap: () => controller.toggleTag(tag.id),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 9.h,
                                ),
                                decoration: BoxDecoration(
                                  color: tag.isSelected
                                      ? const Color(0xFFE8F5E9)
                                      : const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    color: tag.isSelected
                                        ? AppColors.primaryColor
                                        : Colors.transparent,
                                    width: 1.w,
                                  ),
                                ),
                                child: Text(
                                  tag.label,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: tag.isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: tag.isSelected
                                        ? AppColors.primaryColor
                                        : const Color(0xFF374151),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // "মন্তব্য (ঐচ্ছিক)" Feedback Input Section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'মন্তব্য (ঐচ্ছিক)',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    TextField(
                      controller: controller.commentController,
                      maxLines: 4,
                      style: TextStyle(fontSize: 13.5.sp),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'আপনার অভিজ্ঞতা শেয়ার করুন...',
                        hintStyle: TextStyle(color: AppColors.textLightGrey),
                        contentPadding: EdgeInsets.all(14.r),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.cardBorder, width: 1.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.cardBorder, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // Action Buttons (রেটিং জমা দিন & এড়িয়ে যান)
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: controller.onSubmitRating,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'রেটিং জমা দিন',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: OutlinedButton(
                        onPressed: controller.onSkip,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          side: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'এড়িয়ে যান',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
