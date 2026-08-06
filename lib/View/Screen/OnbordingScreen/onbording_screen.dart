import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppImg/app_img.dart';
import '../../../Utils/StaticString/static_string.dart';
import 'Controller/onbording_controller.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE9F4EE), // Soft light mint at top
              Color(0xFFF7FAF8), // Smooth transition
              Colors.white,       // White at bottom
            ],
            stops: [0.0, 0.35, 0.7],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 64.h),

                // Top Green Squircle Logo Container
                Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(26.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withAlpha(70),
                        blurRadius: 20.r,
                        offset: Offset(0, 10.h),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26.r),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImg.homeImgFull,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                // Title Text
                Text(
                  StaticString.onboardingTitle1,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    height: 1.2,
                  ),
                ),
                Text(
                  StaticString.onboardingTitle2,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 12.h),

                // Subtitle Text
                Text(
                  '${StaticString.onboardingSub1}\n${StaticString.onboardingSub2}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 24.h),

                // 3 Statistics Cards Row
                Row(
                  children: [
                    _buildStatCard(
                      value: StaticString.statBookingVal,
                      label: StaticString.statBookingLabel,
                    ),
                    SizedBox(width: 10.w),
                    _buildStatCard(
                      value: StaticString.statProfessionalVal,
                      label: StaticString.statProfessionalLabel,
                    ),
                    SizedBox(width: 10.w),
                    _buildStatCard(
                      value: StaticString.statRatingVal,
                      label: StaticString.statRatingLabel,
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                // Login Button (Primary Filled Green)
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
                        borderRadius: BorderRadius.circular(16.r),
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

                SizedBox(height: 12.h),

                // Register Button (Outlined Green)
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: OutlinedButton(
                    onPressed: controller.onRegisterPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.5.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      StaticString.register,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Divider with "অথবা"
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.cardBorder,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Text(
                        StaticString.or,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.textLightGrey,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.cardBorder,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Service Provider Login Button
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: controller.onServiceProviderLoginPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonSecondaryBg,
                      foregroundColor: AppColors.textColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work_outline_rounded,
                          size: 20.sp,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          StaticString.serviceProviderLogin,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Explore Now Link
                TextButton(
                  onPressed: controller.onExploreNowPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        StaticString.exploreNow,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 16.sp,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget for 3 Stat Cards
  Widget _buildStatCard({required String value, required String label}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.cardBorder, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(6),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
