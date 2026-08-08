import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/provider_profile_controller.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),

              // 1. Top Provider Info Header Row (Matching Screenshot)
              Obx(
                () => Row(
                  children: [
                    // Avatar Box with Bengali Initial Letter 'ক'
                    Container(
                      width: 68.w,
                      height: 68.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.providerName.value.isNotEmpty
                            ? controller.providerName.value.substring(0, 1)
                            : 'ক',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w),

                    // Name, Phone & Rating Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.providerName.value,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            controller.providerPhone.value,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: const Color(0xFFF59E0B),
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                controller.ratingText.value,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 22.h),

              // 2. 3 Stat Grid Cards Row (কাজ, এই মাসে, সাফল্য)
              Obx(
                () => Row(
                  children: [
                    // Card 1: কাজ
                    _buildStatCard(
                      value: controller.totalTasksCount.value,
                      label: StaticString.providerTotalTasksLabel.tr,
                    ),
                    SizedBox(width: 10.w),

                    // Card 2: এই মাসে
                    _buildStatCard(
                      value: controller.thisMonthTasksCount.value,
                      label: StaticString.providerThisMonthLabel.tr,
                    ),
                    SizedBox(width: 10.w),

                    // Card 3: সাফল্য
                    _buildStatCard(
                      value: controller.successRateText.value,
                      label: StaticString.successRateLabel.tr,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // 3. Profile Option List Cards (Matching Screenshot)
              _buildOptionCard(
                icon: Icons.edit_outlined,
                title: StaticString.providerEditProfileTitle.tr,
                onTap: controller.onEditProfilePressed,
              ),
              SizedBox(height: 12.h),

              _buildOptionCard(
                icon: Icons.star_outline_rounded,
                title: StaticString.providerReviewsTitle.tr,
                onTap: controller.onReviewsPressed,
              ),
              SizedBox(height: 12.h),

              _buildOptionCard(
                icon: Icons.settings_outlined,
                title: StaticString.providerSettingsTitle.tr,
                onTap: controller.onSettingsPressed,
              ),
              SizedBox(height: 12.h),

              _buildOptionCard(
                icon: Icons.help_outline_rounded,
                title: StaticString.providerHelpTitle.tr,
                onTap: controller.onHelpPressed,
              ),
              SizedBox(height: 12.h),

              // Logout Card (Red themed)
              _buildOptionCard(
                icon: Icons.logout_rounded,
                title: StaticString.providerLogoutTitle.tr,
                isLogout: true,
                onTap: controller.onLogoutPressed,
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // Stat Card Builder
  Widget _buildStatCard({required String value, required String label}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.cardBorder, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 17.5.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profile Option Card Builder
  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final iconBgColor = isLogout ? const Color(0xFFFEE2E2) : const Color(0xFFF3F4F6);
    final iconColor = isLogout ? const Color(0xFFEF4444) : AppColors.textColor;
    final textColor = isLogout ? const Color(0xFFEF4444) : AppColors.textColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.cardBorder, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Icon Box
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20.sp,
              ),
            ),

            SizedBox(width: 14.w),

            // Option Title Text
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            // Right Chevron Arrow Icon (hidden for logout)
            if (!isLogout)
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textLightGrey,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
