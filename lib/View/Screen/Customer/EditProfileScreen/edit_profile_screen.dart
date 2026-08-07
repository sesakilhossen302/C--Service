import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'প্রোফাইল সম্পাদনা',
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
                    // Center Avatar Box with Edit Badge
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 84.w,
                            height: 84.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  controller.avatarInitial.value,
                                  style: TextStyle(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Bottom Right Edit Pencil Circle
                          Positioned(
                            bottom: -4.h,
                            right: -4.w,
                            child: GestureDetector(
                              onTap: controller.onPickAvatar,
                              child: Container(
                                width: 28.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2.w),
                                ),
                                child: Icon(
                                  Icons.edit_rounded,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // Field 1: সম্পূর্ণ নাম
                    _buildInputField(
                      label: 'সম্পূর্ণ নাম',
                      controller: controller.nameController,
                    ),

                    SizedBox(height: 16.h),

                    // Field 2: মোবাইল নম্বর
                    _buildInputField(
                      label: 'মোবাইল নম্বর',
                      controller: controller.mobileController,
                      keyboardType: TextInputType.phone,
                    ),

                    SizedBox(height: 16.h),

                    // Field 3: ইমেইল
                    _buildInputField(
                      label: 'ইমেইল',
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 16.h),

                    // Field 4: ঠিকানা
                    _buildInputField(
                      label: 'ঠিকানা',
                      controller: controller.addressController,
                    ),

                    SizedBox(height: 32.h),

                    // Bottom Action Button: সংরক্ষণ করুন
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: controller.onSaveProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'সংরক্ষণ করুন',
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.5.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
      ],
    );
  }
}
