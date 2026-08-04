import 'package:flutter/material.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppImg/app_img.dart';
import '../../../Utils/StaticString/static_string.dart';
import 'Controller/onbording_controller.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnbordingController();

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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Top Green Squircle Logo Container
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withAlpha(70),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImg.homeImgFull,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Title Text
                const Text(
                  StaticString.onboardingTitle1,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    height: 1.2,
                  ),
                ),
                const Text(
                  StaticString.onboardingTitle2,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                // Subtitle Text
                const Text(
                  '${StaticString.onboardingSub1}\n${StaticString.onboardingSub2}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 24),

                // 3 Statistics Cards Row
                Row(
                  children: [
                    _buildStatCard(
                      value: StaticString.statBookingVal,
                      label: StaticString.statBookingLabel,
                    ),
                    const SizedBox(width: 10),
                    _buildStatCard(
                      value: StaticString.statProfessionalVal,
                      label: StaticString.statProfessionalLabel,
                    ),
                    const SizedBox(width: 10),
                    _buildStatCard(
                      value: StaticString.statRatingVal,
                      label: StaticString.statRatingLabel,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Login Button (Primary Filled Green)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: controller.onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      StaticString.login,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Register Button (Outlined Green)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: controller.onRegisterPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      StaticString.register,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Divider with "অথবা"
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: AppColors.cardBorder,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        StaticString.or,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textLightGrey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.cardBorder,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Service Provider Login Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: controller.onServiceProviderLoginPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonSecondaryBg,
                      foregroundColor: AppColors.textColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.work_outline_rounded,
                          size: 20,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          StaticString.serviceProviderLogin,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Explore Now Link
                TextButton(
                  onPressed: controller.onExploreNowPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        StaticString.exploreNow,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
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
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(6),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
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
