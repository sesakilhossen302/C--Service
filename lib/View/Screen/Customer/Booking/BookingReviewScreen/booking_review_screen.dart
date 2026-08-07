import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/booking_review_controller.dart';

class BookingReviewScreen extends StatelessWidget {
  const BookingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingReviewController());

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
                    'বুকিং রিভিউ',
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

            // 2. Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট)
            _buildStepProgressIndicator(),

            SizedBox(height: 20.h),

            // Main Review Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    // Card 1: সেবার বিবরণ
                    Container(
                      padding: EdgeInsets.all(16.r),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'সেবার বিবরণ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.onChangeService,
                                child: Text(
                                  'পরিবর্তন',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              Container(
                                width: 46.w,
                                height: 46.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      controller.reviewData.value.serviceSummary.iconEmoji,
                                      style: TextStyle(fontSize: 24.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.reviewData.value.serviceSummary.serviceTitle,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Obx(
                                    () => Text(
                                      controller.reviewData.value.serviceSummary.durationText,
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Card 2: ঠিকানা
                    Container(
                      padding: EdgeInsets.all(16.r),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ঠিকানা',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.onChangeAddress,
                                child: Text(
                                  'পরিবর্তন',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Obx(
                                  () => Text(
                                    controller.reviewData.value.addressSummary.fullAddress,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Card 3: তারিখ ও সময়
                    Container(
                      padding: EdgeInsets.all(16.r),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'তারিখ ও সময়',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.onChangeDateTime,
                                child: Text(
                                  'পরিবর্তন',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Obx(
                            () => Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColors.primaryColor,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  controller.reviewData.value.dateTimeSummary.dateText,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Icon(
                                  Icons.access_time_rounded,
                                  color: AppColors.primaryColor,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  controller.reviewData.value.dateTimeSummary.timeText,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Card 4: মূল্য বিবরণ
                    Container(
                      padding: EdgeInsets.all(16.r),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'মূল্য বিবরণ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'সেবা মূল্য',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '৳${controller.reviewData.value.priceBreakdown.servicePrice}',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ভ্রমণ চার্জ',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '৳${controller.reviewData.value.priceBreakdown.travelCharge}',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(color: AppColors.cardBorder.withAlpha(120), height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'মোট',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '৳${controller.reviewData.value.priceBreakdown.totalPrice}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // 3. Bottom Sticky Action Button (পেমেন্ট করুন)
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
                    onPressed: controller.onProceedToPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'পেমেন্ট করুন',
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

  // Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট)
  Widget _buildStepProgressIndicator() {
    final steps = ['ঠিকানা', 'সময়', 'রিভিউ', 'পেমেন্ট'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isCompletedOrActive = index <= 2;

          return Expanded(
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isCompletedOrActive
                        ? AppColors.primaryColor
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: isCompletedOrActive ? FontWeight.bold : FontWeight.normal,
                    color: isCompletedOrActive
                        ? AppColors.primaryColor
                        : AppColors.textLightGrey,
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
