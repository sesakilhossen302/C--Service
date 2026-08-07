import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? bgColor;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.maybePop(context),
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: bgColor ?? (iconColor == Colors.white ? Colors.white.withAlpha(40) : AppColors.buttonSecondaryBg),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          color: iconColor ?? AppColors.textColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
