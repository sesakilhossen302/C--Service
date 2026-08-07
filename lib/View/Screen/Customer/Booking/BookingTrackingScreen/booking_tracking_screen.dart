import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/booking_tracking_controller.dart';
import 'Model/booking_tracking_model.dart';

class BookingTrackingScreen extends StatelessWidget {
  const BookingTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingTrackingController());

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
                    'বুকিং ট্র্যাকিং',
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

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service Header Card
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  controller.trackingData.value.serviceTitle,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Obx(
                                () => Text(
                                  controller.trackingData.value.dateTimeText,
                                  style: TextStyle(
                                    fontSize: 12.5.sp,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Mint Green Status Pill
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F5E9),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Obx(
                              () => Text(
                                controller.trackingData.value.statusTag,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Technician Info Card
                    Container(
                      padding: EdgeInsets.all(14.r),
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
                        children: [
                          // Left Avatar Box
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F5E9),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  controller.trackingData.value.technician.avatarEmoji,
                                  style: TextStyle(fontSize: 22.sp),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 14.w),

                          // Technician Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.trackingData.value.technician.name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Obx(
                                  () => Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        size: 15.sp,
                                        color: const Color(0xFFF59E0B),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '${controller.trackingData.value.technician.rating} • ${controller.trackingData.value.technician.totalServicesCount} সেবা',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right Call Button
                          GestureDetector(
                            onTap: controller.onCallTechnician,
                            child: Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Icon(
                                Icons.phone_outlined,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // "অগ্রগতি" Progress Timeline Section Card
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
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
                            'অগ্রগতি',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),

                          SizedBox(height: 18.h),

                          // Stepper Timeline List
                          Obx(
                            () => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.trackingData.value.steps.length,
                              itemBuilder: (context, index) {
                                final step = controller.trackingData.value.steps[index];
                                final isLast = index == controller.trackingData.value.steps.length - 1;

                                return _buildTimelineRow(step, isLast);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // Primary Button: সেবা সম্পন্ন করুন ও রেট করুন
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: controller.onCompleteAndRate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'সেবা সম্পন্ন করুন ও রেট করুন',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Support Tile: সমস্যা হচ্ছে?
                    GestureDetector(
                      onTap: controller.onHelpPressed,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: AppColors.cardBorder, width: 1.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'সমস্যা হচ্ছে?',
                              style: TextStyle(
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: AppColors.textLightGrey,
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Vertical Timeline Item Row
  Widget _buildTimelineRow(TrackingStepModel step, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Node Icon & Connecting Line
          Column(
            children: [
              _buildStepIcon(step.status),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: step.status == TrackingStepStatus.completed
                        ? AppColors.primaryColor
                        : const Color(0xFFE5E7EB),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                  ),
                ),
            ],
          ),

          SizedBox(width: 14.w),

          // Right Text Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontWeight: step.status != TrackingStepStatus.pending
                          ? FontWeight.bold
                          : FontWeight.w500,
                      color: step.status != TrackingStepStatus.pending
                          ? AppColors.textColor
                          : AppColors.textLightGrey,
                    ),
                  ),
                  if (step.timeText.isNotEmpty) ...[
                    SizedBox(height: 3.h),
                    Text(
                      step.timeText,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon(TrackingStepStatus status) {
    switch (status) {
      case TrackingStepStatus.completed:
        return Icon(
          Icons.check_circle_rounded,
          color: AppColors.primaryColor,
          size: 24.sp,
        );
      case TrackingStepStatus.active:
        return Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF59E0B),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3.w),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF59E0B).withAlpha(80),
                blurRadius: 6.r,
              ),
            ],
          ),
        );
      case TrackingStepStatus.pending:
        return Container(
          width: 20.w,
          height: 20.h,
          decoration: const BoxDecoration(
            color: Color(0xFFE5E7EB),
            shape: BoxShape.circle,
          ),
        );
    }
  }
}
