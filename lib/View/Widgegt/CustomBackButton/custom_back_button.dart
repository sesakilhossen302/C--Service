import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.maybePop(context),
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: const BoxDecoration(
          color: AppColors.buttonSecondaryBg,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.textColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
