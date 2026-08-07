import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import 'Controller/booking_success_controller.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingSuccessController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // 1. Large Mint Checkmark Circle Box
              Container(
                width: 110.w,
                height: 110.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_rounded,
                    color: AppColors.primaryColor,
                    size: 54.sp,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // 2. Success Heading
              Text(
                StaticString.bookingSuccessHeading.tr,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                StaticString.bookingSuccessSubheading.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textGrey,
                ),
              ),

              SizedBox(height: 4.h),

              Obx(
                () => RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textColor,
                    ),
                    children: [
                      TextSpan(text: StaticString.bookingIdLabel.tr),
                      TextSpan(
                        text: controller.successData.value.bookingId,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // 3. Booking Details Summary Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAF8),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.cardBorder, width: 1.w),
                ),
                child: Column(
                  children: [
                    // Date Row
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Obx(
                          () => Text(
                            controller.successData.value.dateText,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    // Time Row
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Obx(
                          () => Text(
                            controller.successData.value.timeText,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    // Address Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.successData.value.fullAddress,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                color: AppColors.textColor,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // 4. Action Buttons (বুকিং ট্র্যাক করুন & হোমে ফিরুন)
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.onTrackBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    StaticString.trackBookingButton.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: OutlinedButton(
                  onPressed: controller.onBackToHome,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    side: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    StaticString.backToHomeButton.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
