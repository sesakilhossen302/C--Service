import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'Controller/customer_profile_controller.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            children: [
              SizedBox(height: 6.h),

              // 1. User Info Header Card
              Row(
                children: [
                  // Left Initial Avatar Box
                  Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          controller.userInfo.value.avatarInitial,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 14.w),

                  // Middle Name & Phone & Membership Tag
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            controller.userInfo.value.name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Obx(
                          () => Text(
                            controller.userInfo.value.phone,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Obx(
                          () => Row(
                            children: [
                              Icon(
                                Icons.military_tech_rounded,
                                size: 15.sp,
                                color: const Color(0xFFD97706),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                controller.userInfo.value.membershipTag,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFD97706),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // 2. Menu Items List
              _buildMenuItem(
                icon: Icons.edit_outlined,
                title: 'প্রোফাইল সম্পাদনা',
                onTap: controller.onEditProfile,
              ),
              _buildMenuItem(
                icon: Icons.calendar_today_outlined,
                title: 'আমার বুকিং',
                onTap: controller.onMyBookings,
              ),
              _buildMenuItem(
                icon: Icons.star_border_rounded,
                title: 'আমার রিভিউ',
                onTap: controller.onMyReviews,
              ),
              _buildMenuItem(
                icon: Icons.workspace_premium_outlined,
                title: 'HomeCare Prime',
                onTap: controller.onHomeCarePrime,
              ),
              _buildMenuItem(
                icon: Icons.card_giftcard_outlined,
                title: 'রেফারেল',
                onTap: controller.onReferral,
              ),
              _buildMenuItem(
                icon: Icons.location_on_outlined,
                title: 'সংরক্ষিত ঠিকানা',
                onTap: controller.onSavedAddresses,
              ),
              _buildMenuItem(
                icon: Icons.help_outline_rounded,
                title: 'সাহায্য',
                onTap: controller.onHelp,
              ),
              _buildMenuItem(
                icon: Icons.chat_bubble_outline_rounded,
                title: 'যোগাযোগ করুন',
                onTap: controller.onContactUs,
              ),
              _buildMenuItem(
                icon: Icons.language_rounded,
                title: 'ভাষা পরিবর্তন',
                onTap: controller.onChangeLanguage,
              ),
              _buildMenuItem(
                icon: Icons.lock_outline_rounded,
                title: 'গোপনীয়তা নীতি',
                onTap: controller.onPrivacyPolicy,
              ),
              _buildMenuItem(
                icon: Icons.article_outlined,
                title: 'শর্তাবলী',
                onTap: controller.onTermsAndConditions,
              ),
              _buildMenuItem(
                icon: Icons.settings_outlined,
                title: 'সেটিংস',
                onTap: controller.onSettings,
              ),

              // Logout Red Card
              _buildMenuItem(
                icon: Icons.logout_rounded,
                title: 'লগআউট',
                isDestructive: true,
                onTap: controller.onLogout,
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.cardBorder, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                blurRadius: 6.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon Container Box
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: isDestructive ? const Color(0xFFFEF2F2) : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: isDestructive ? const Color(0xFFEF4444) : AppColors.textColor,
                  size: 20.sp,
                ),
              ),

              SizedBox(width: 14.w),

              // Menu Title Text
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.bold,
                    color: isDestructive ? const Color(0xFFEF4444) : AppColors.textColor,
                  ),
                ),
              ),

              // Right Chevron Arrow (if not logout)
              if (!isDestructive)
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textLightGrey,
                  size: 22.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
