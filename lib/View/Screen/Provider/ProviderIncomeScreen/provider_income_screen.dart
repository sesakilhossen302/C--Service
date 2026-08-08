import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/provider_income_controller.dart';
import 'Model/provider_income_model.dart';

class ProviderIncomeScreen extends StatelessWidget {
  const ProviderIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderIncomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              // 1. Header Title: আয়
              Text(
                StaticString.earningsTitle.tr,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 16.h),

              // 2. Green Total Balance Card (From Screenshot)
              Obx(
                () => Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withAlpha(50),
                        blurRadius: 14.r,
                        offset: Offset(0, 6.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StaticString.totalBalanceLabel.tr,
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: Colors.white.withAlpha(210),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        controller.totalBalance.value,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 18.h),

                      // 2 Sub-cards Row (এই মাসে, গতমাসে)
                      Row(
                        children: [
                          // Sub-card 1: এই মাসে
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(35),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StaticString.providerThisMonthLabel.tr,
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      color: Colors.white.withAlpha(200),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    controller.thisMonthIncome.value,
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Sub-card 2: গতমাসে
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(35),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StaticString.lastMonthLabel.tr,
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      color: Colors.white.withAlpha(200),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    controller.lastMonthIncome.value,
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // 3. Quick Actions Cards (উত্তোলন & বিশ্লেষণ)
              Row(
                children: [
                  // Action 1: উত্তোলন
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.onWithdrawPressed,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
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
                        child: Column(
                          children: [
                            Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE8F5E9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: AppColors.primaryColor,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              StaticString.withdrawLabel.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 14.w),

                  // Action 2: বিশ্লেষণ
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.onAnalyticsPressed,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
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
                        child: Column(
                          children: [
                            Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEFF6FF),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.bar_chart_rounded,
                                color: const Color(0xFF2563EB),
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              StaticString.analyticsLabel.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 22.h),

              // 4. Section Header: সাম্প্রতিক লেনদেন
              Text(
                StaticString.recentTransactionsTitle.tr,
                style: TextStyle(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 12.h),

              // Transaction List Items
              Obx(
                () => Column(
                  children: controller.transactions.map((tx) {
                    return _buildTransactionCard(tx);
                  }).toList(),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // Transaction Item Card Builder Widget
  Widget _buildTransactionCard(ProviderTransactionModel tx) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
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
            // Left Mint Icon Container
            Container(
              width: 42.w,
              height: 42.h,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
            ),

            SizedBox(width: 12.w),

            // Middle Title & Date Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    tx.dateText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textLightGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Right Green Amount Text
            Text(
              tx.amountText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
