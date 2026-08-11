import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Core/AppRoute/app_route.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  Timer? _loadingTimer;

  @override
  void initState() {
    super.initState();
    // Animated loading indicator timer
    _loadingTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % 3;
        });
      }
    });

    // Navigate to onboarding screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      _loadingTimer?.cancel();
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoute.onbordingScreen);
      }
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                AppIcons.logoWhite,
                width: 120.w,
                height: 120.h,
              ),
              SizedBox(height: 20.h),
              Text(
                StaticString.appName,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                StaticString.appSubtitle,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withAlpha(216),
                ),
              ),
              const Spacer(),
              // Bottom Pill Loading Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final isActive = index == _currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: isActive ? 36.w : 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.white
                          : AppColors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
