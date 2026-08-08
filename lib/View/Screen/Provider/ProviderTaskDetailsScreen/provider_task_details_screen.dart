import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/provider_task_details_controller.dart';

class ProviderTaskDetailsScreen extends StatelessWidget {
  const ProviderTaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderTaskDetailsController());
    final task = controller.task;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8.h),

            // 1. Top Header Bar: Back Button + "কাজের বিবরণ"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: 14.w),
                  Text(
                    StaticString.taskDetailsTitle.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    // 2. Top Details Card
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.cardBorder, width: 1.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(6),
                            blurRadius: 10.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title & Status Badge Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              _buildStatusBadge(task.status),
                            ],
                          ),

                          SizedBox(height: 2.h),

                          // Job ID Text
                          Text(
                            '${StaticString.jobIdPrefix.tr}${task.jobId}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textLightGrey,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          // Customer Name Row
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                size: 16.sp,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                task.customerName,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          // Location Row
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16.sp,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                task.location,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          // Date & Time Row
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 15.sp,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '${task.dateText} • ${task.timeText}',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // 3. Payment Details Card
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.cardBorder, width: 1.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(6),
                            blurRadius: 10.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left: সেবা মূল্য
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StaticString.providerServicePriceLabel.tr,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                task.priceText,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),

                          // Right: পেমেন্ট
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                StaticString.paymentMethodLabel.tr,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                task.paymentMethod,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // 4. Action Buttons Section
                    if (task.status == 'চলমান' || task.status == 'আসন্ন') ...[
                      // "কাজ সম্পন্ন করুন" Button (Filled Green)
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: controller.onCompleteTaskPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            StaticString.completeTaskAction.tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // "গ্রাহককে কল করুন" Button (Outlined Green)
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: OutlinedButton(
                          onPressed: controller.onCallCustomerPressed,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            StaticString.callCustomerAction.tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      // "রিভিউ দেখুন" Button (Filled Green for Completed tasks)
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: controller.onViewReviewPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            StaticString.viewReviewAction.tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dynamic Status Badge Pill Widget based on status
  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;

    if (status == 'চলমান') {
      bgColor = const Color(0xFFD1FAE5);
      textColor = const Color(0xFF065F46);
    } else if (status == 'আসন্ন') {
      bgColor = const Color(0xFFFEF3C7);
      textColor = const Color(0xFFD97706);
    } else {
      bgColor = const Color(0xFFE0F2FE);
      textColor = const Color(0xFF0284C7);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
