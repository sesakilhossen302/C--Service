import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());

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
                    StaticString.paymentTitle.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // 2. Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট - ALL GREEN)
            _buildStepProgressIndicator(),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Total Payment Banner Card
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.cardBorder, width: 1.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(6),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StaticString.totalPayment.tr,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                          Obx(
                            () => Text(
                              '৳${controller.paymentData.value.totalAmount}',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Section Title: পেমেন্ট পদ্ধতি
                    Text(
                      StaticString.paymentMethod.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Payment Methods Options List
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.paymentData.value.paymentMethods.length,
                        separatorBuilder: (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final method = controller.paymentData.value.paymentMethods[index];
                          return Obx(() {
                            final isSelected = controller.selectedMethodId.value == method.id;
                            return GestureDetector(
                              onTap: () => controller.selectMethod(method.id),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.all(14.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.cardBorder,
                                    width: isSelected ? 1.5.w : 1.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(6),
                                      blurRadius: 6.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Method Logo Box
                                    Container(
                                      width: 44.w,
                                      height: 44.h,
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        color: _getBgColorForMethod(method.logoType),
                                        borderRadius: BorderRadius.circular(14.r),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.r),
                                        child: Image.asset(
                                          method.imageAssetPath,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stackTrace) => Center(
                                            child: Text(
                                              method.iconEmoji,
                                              style: TextStyle(fontSize: 20.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 14.w),

                                    // Method Title
                                    Expanded(
                                      child: Text(
                                        method.title,
                                        style: TextStyle(
                                          fontSize: 15.5.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ),

                                    // Right Selection Checkmark
                                    Icon(
                                      isSelected
                                          ? Icons.check_circle_rounded
                                          : Icons.circle_outlined,
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : const Color(0xFFD1D5DB),
                                      size: 22.sp,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // bKash Number Input Container (shown if bKash selected)
                    Obx(() {
                      if (controller.selectedMethodId.value == 'bkash') {
                        return Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF1F2),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: const Color(0xFFFBCFE8),
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StaticString.bkashNumberLabel.tr,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              TextField(
                                controller: controller.accountNumberController,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(fontSize: 14.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: controller.paymentData.value.accountNumberHint,
                                  hintStyle: TextStyle(color: AppColors.textLightGrey),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 12.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                      color: const Color(0xFFF9A8D4),
                                      width: 1.w,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                      color: const Color(0xFFF9A8D4),
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),

                    SizedBox(height: 16.h),

                    // SSL Encrypted Safety Badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: const Color(0xFFBBF7D0),
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shield_outlined,
                            color: AppColors.primaryColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            StaticString.sslSecureBadge.tr,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // 3. Bottom Sticky Action Button (পেমেন্ট নিশ্চিত করুন)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 10.r,
                    offset: Offset(0, -2.h),
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: controller.onConfirmPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      StaticString.confirmPayment.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBgColorForMethod(String logoType) {
    switch (logoType) {
      case 'bkash':
        return const Color(0xFFFCE7F3);
      case 'nagad':
        return const Color(0xFFFFEDD5);
      case 'card':
        return const Color(0xFFDBEAFE);
      case 'debit':
        return const Color(0xFFE8F5E9);
      case 'cash':
        return const Color(0xFFFEF3C7);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  // Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট - ALL COMPLETED GREEN)
  Widget _buildStepProgressIndicator() {
    final steps = [
      StaticString.stepAddress.tr,
      StaticString.stepTime.tr,
      StaticString.stepReview.tr,
      StaticString.stepPayment.tr,
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: steps.map((title) {
          return Expanded(
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
