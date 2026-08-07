import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/service_details_controller.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Top Banner Container
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD1FAE5),
                        ),
                        child: Center(
                          child: Obx(
                            () => Text(
                              controller.serviceDetails.value.iconEmoji,
                              style: TextStyle(fontSize: 84.sp),
                            ),
                          ),
                        ),
                      ),

                      // Top Navigation & Favorite Buttons Row
                      Positioned(
                        top: 44.h,
                        left: 18.w,
                        right: 18.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomBackButton(),
                            Obx(
                              () => GestureDetector(
                                onTap: controller.toggleFavorite,
                                child: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(20),
                                        blurRadius: 8.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    controller.isFavorite.value
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: controller.isFavorite.value
                                        ? Colors.redAccent
                                        : AppColors.textColor,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 2. Service Header & Info Body
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title & Price Row
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.serviceDetails.value.title,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                controller.serviceDetails.value.priceText,
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8.h),

                        // Rating & Duration Row
                        Obx(
                          () => Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: const Color(0xFFF59E0B),
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '${controller.serviceDetails.value.rating}',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '(${controller.serviceDetails.value.reviewCount})',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.textLightGrey,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Icon(
                                Icons.access_time_rounded,
                                color: AppColors.textLightGrey,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                controller.serviceDetails.value.durationText,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.textLightGrey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 18.h),

                        // Service Description Container
                        Obx(
                          () => Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              controller.serviceDetails.value.description,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                color: const Color(0xFF4B5563),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 22.h),

                        // "সেবায় যা থাকবে" Section Header
                        Text(
                          StaticString.whatIsIncludedTitle.tr,
                          style: TextStyle(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Features List with Green Checkmarks
                        Obx(
                          () => Column(
                            children: controller.serviceDetails.value.includedFeatures.map((feature) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD1FAE5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: AppColors.primaryColor,
                                        size: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      feature,
                                      style: TextStyle(
                                        fontSize: 13.5.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF374151),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // "গ্রাহকদের মতামত" Section Header
                        Text(
                          StaticString.customerReviewsTitle.tr,
                          style: TextStyle(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Reviews List Cards
                        Obx(
                          () => Column(
                            children: controller.serviceDetails.value.reviews.map((review) {
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all(14.r),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          review.userName,
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              index < review.rating.toInt()
                                                  ? Icons.star_rounded
                                                  : Icons.star_border_rounded,
                                              color: const Color(0xFFF59E0B),
                                              size: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      review.comment,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: const Color(0xFF4B5563),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      review.timeAgoText,
                                      style: TextStyle(
                                        fontSize: 11.5.sp,
                                        color: AppColors.textLightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Bottom Sticky Action Button Bar
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
                  onPressed: controller.onBookNowPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      '${StaticString.bookNowPrefix.tr} — ${controller.serviceDetails.value.priceText}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
