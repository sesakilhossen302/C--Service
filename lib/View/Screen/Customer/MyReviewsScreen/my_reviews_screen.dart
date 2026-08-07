import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/my_reviews_controller.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyReviewsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),

              // Top Header Bar
              Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: 14.w),
                  Text(
                    StaticString.myReviews.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              // 1. Overall Rating & Progress Breakdown Summary Card
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
                child: Row(
                  children: [
                    // Left Column (Average Rating & Stars)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            '${controller.averageRating.value}',
                            style: TextStyle(
                              fontSize: 34.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star_rounded,
                              color: const Color(0xFFF59E0B),
                              size: 16.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Obx(
                          () => Text(
                            '${controller.totalReviewsCount.value} ${StaticString.reviews.tr}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textLightGrey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 20.w),

                    // Right Column (Rating Progress Bars: 5, 4, 3 Stars)
                    Expanded(
                      child: Obx(
                        () => Column(
                          children: controller.ratingBreakdown.map((item) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: Row(
                                children: [
                                  Text(
                                    '${item.starCount}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.textGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: LinearProgressIndicator(
                                        value: item.ratio,
                                        minHeight: 7.h,
                                        backgroundColor: const Color(0xFFE5E7EB),
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          Color(0xFFF59E0B),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // 2. Reviews List Cards
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.userReviews.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final review = controller.userReviews[index];
                    return Container(
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
                          // Top Row: Service Title & Star Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                review.serviceTitle,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    starIndex < review.rating.toInt()
                                        ? Icons.star_rounded
                                        : Icons.star_border_rounded,
                                    color: const Color(0xFFF59E0B),
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          // Comment Text Body
                          Text(
                            review.comment,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              color: const Color(0xFF4B5563),
                              height: 1.35,
                            ),
                          ),

                          SizedBox(height: 12.h),

                          // Footer: Provider Name & Date
                          Row(
                            children: [
                              Text(
                                review.providerName,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textLightGrey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Text(
                                  '•',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textLightGrey,
                                  ),
                                ),
                              ),
                              Text(
                                review.dateText,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textLightGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
