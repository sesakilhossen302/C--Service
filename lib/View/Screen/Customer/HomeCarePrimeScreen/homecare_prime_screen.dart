import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/homecare_prime_controller.dart';
import 'Model/homecare_prime_model.dart';

class HomeCarePrimeScreen extends StatelessWidget {
  const HomeCarePrimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeCarePrimeController());

    return Scaffold(
      backgroundColor: const Color(0xFF162B21),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 6.h),

            // 1. Dark Top Header Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: 14.w),
                  Text(
                    'HomeCare Prime',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Amber Badge & Header Text Section
            Column(
              children: [
                // Amber Ribbon Badge Box
                Container(
                  width: 68.w,
                  height: 68.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF59E0B),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF59E0B).withAlpha(100),
                        blurRadius: 16.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.military_tech_rounded,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                ),

                SizedBox(height: 14.h),

                Text(
                  'Prime সদস্যপদ',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'বাড়ির সম্পূর্ণ যত্নে সেরা মূল্য',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // 2. White Bottom Curved Body
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAF8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                  child: Column(
                    children: [
                      // 5 Benefits Items
                      ...controller.benefits.map((benefit) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: AppColors.cardBorder, width: 1.w),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  color: AppColors.primaryColor,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  benefit,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      SizedBox(height: 14.h),

                      // 2 Membership Plans Selection Cards
                      Obx(
                        () => Column(
                          children: controller.plans.map((plan) {
                            return _buildPlanCard(plan, controller);
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Bottom Sticky Action Button: Prime সদস্য হন
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: controller.onJoinPrime,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            'Prime সদস্য হন',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(PrimePlanModel plan, HomeCarePrimeController controller) {
    final isSelected = plan.isSelected;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () => controller.selectPlan(plan.id),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.cardBorder,
              width: isSelected ? 1.5.w : 1.w,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: AppColors.primaryColor.withAlpha(25),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Title & Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    plan.monthlyPriceText,
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),

              // Right Price & Discount Badge Pill
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plan.totalPriceText,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  if (plan.discountBadge != null) ...[
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        plan.discountBadge!,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
