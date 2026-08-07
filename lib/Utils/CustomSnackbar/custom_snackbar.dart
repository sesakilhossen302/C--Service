import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../AppColors/app_colors.dart';

class CustomSnackbar {
  static void showSuccess({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white,
      icon: Icon(
        Icons.check_circle_rounded,
        color: Colors.white,
        size: 26.sp,
      ),
      margin: EdgeInsets.all(16.r),
      borderRadius: 16.r,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeIn,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryColor.withAlpha(80),
          blurRadius: 12.r,
          offset: Offset(0, 4.h),
        ),
      ],
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 13.sp,
          color: const Color(0xFFE8F5E9),
        ),
      ),
    );
  }

  static void showInfo({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF1E293B),
      colorText: Colors.white,
      icon: Icon(
        Icons.info_outline_rounded,
        color: const Color(0xFF38BDF8),
        size: 26.sp,
      ),
      margin: EdgeInsets.all(16.r),
      borderRadius: 16.r,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeIn,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withAlpha(60),
          blurRadius: 12.r,
          offset: Offset(0, 4.h),
        ),
      ],
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 13.sp,
          color: const Color(0xFFCBD5E1),
        ),
      ),
    );
  }

  static void showWarning({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFFD97706),
      colorText: Colors.white,
      icon: Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
        size: 26.sp,
      ),
      margin: EdgeInsets.all(16.r),
      borderRadius: 16.r,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeIn,
      boxShadows: [
        BoxShadow(
          color: const Color(0xFFD97706).withAlpha(80),
          blurRadius: 12.r,
          offset: Offset(0, 4.h),
        ),
      ],
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 13.sp,
          color: const Color(0xFFFEF3C7),
        ),
      ),
    );
  }
}
