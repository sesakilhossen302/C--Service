import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/search_service_controller.dart';

class SearchServiceScreen extends StatelessWidget {
  const SearchServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchServiceController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // Top Header: Back Button & Search Input Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        autofocus: true,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: 'কী সেবা চান?',
                          hintStyle: TextStyle(
                            color: AppColors.textLightGrey,
                            fontSize: 14.sp,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.textLightGrey,
                            size: 22.sp,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 14.h),

            // Category Filter Chips Bar
            SizedBox(
              height: 38.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                itemCount: controller.categories.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final cat = controller.categories[index];
                  return Obx(() {
                    final isSelected = controller.selectedCategory.value == cat;
                    return GestureDetector(
                      onTap: () => controller.selectCategory(cat),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            cat,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? Colors.white : AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            SizedBox(height: 14.h),

            // Live Search Results List
            Expanded(
              child: Obx(() {
                if (controller.filteredServices.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 48.sp,
                          color: AppColors.textLightGrey,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'কোনো সেবা পাওয়া যায়নি',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                  itemCount: controller.filteredServices.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final item = controller.filteredServices[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoute.serviceDetailsScreen,
                          arguments: {
                            'title': item.title,
                            'price': item.priceText,
                            'rating': item.rating,
                            'reviewCount': item.reviewCount,
                            'emoji': item.iconEmoji,
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
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
                            // Left Emoji Icon Box
                            Container(
                              width: 52.w,
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Center(
                                child: Text(
                                  item.iconEmoji,
                                  style: TextStyle(fontSize: 26.sp),
                                ),
                              ),
                            ),

                            SizedBox(width: 14.w),

                            // Middle Service Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        size: 16.sp,
                                        color: const Color(0xFFF59E0B),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${item.rating} (${item.reviewCount})',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    item.priceText,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Right Chevron Arrow
                            Icon(
                              Icons.chevron_right_rounded,
                              color: AppColors.textLightGrey,
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
