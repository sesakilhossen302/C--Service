import 'package:flutter/material.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.homeImgFull,
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              StaticString.appName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              StaticString.appSubtitle,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.white.withAlpha(216),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

