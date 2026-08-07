import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import 'Controller/my_bookings_controller.dart';
import 'Model/my_bookings_model.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBookingsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            // Header Title: আমার বুকিং
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                StaticString.myBookings.tr,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // 3 Tabs Bar (আসন্ন, সম্পন্ন, বাতিল)
            _buildTabBar(controller),

            SizedBox(height: 16.h),

            // Bookings List View
            Expanded(
              child: Obx(() {
                final bookings = controller.filteredBookings;
                if (bookings.isEmpty) {
                  return Center(
                    child: Text(
                      StaticString.noBookingsFound.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textGrey,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
                  itemCount: bookings.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final item = bookings[index];
                    return GestureDetector(
                      onTap: () => controller.onBookingTap(item),
                      child: Container(
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
                            // Top Row: Title + Status Pill Tag
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.serviceTitle,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                _buildStatusBadge(item.status),
                              ],
                            ),

                            SizedBox(height: 10.h),

                            // Date & Time Row
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15.sp,
                                  color: AppColors.textLightGrey,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  item.dateText,
                                  style: TextStyle(
                                    fontSize: 12.5.sp,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 15.sp,
                                  color: AppColors.textLightGrey,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  item.timeText,
                                  style: TextStyle(
                                    fontSize: 12.5.sp,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),

                            // Address & Price Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 15.sp,
                                        color: AppColors.textLightGrey,
                                      ),
                                      SizedBox(width: 4.w),
                                      Expanded(
                                        child: Text(
                                          item.addressText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: AppColors.textGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  item.priceText,
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

  // 3 Tabs Header Bar (আসন্ন, সম্পন্ন, বাতিল)
  Widget _buildTabBar(MyBookingsController controller) {
    final tabs = [
      StaticString.upcomingBadge.tr,
      StaticString.tabCompleted.tr,
      StaticString.tabCancelled.tr,
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.cardBorder.withAlpha(120),
            width: 1.h,
          ),
        ),
      ),
      child: Obx(
        () => Row(
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final label = entry.value;
            final isSelected = controller.selectedTabIndex.value == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(index),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? AppColors.primaryColor : AppColors.textLightGrey,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 2.5.h,
                      color: isSelected ? AppColors.primaryColor : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Status Badge Helper Pill
  Widget _buildStatusBadge(BookingStatus status) {
    String label;
    Color bgColor;
    Color textColor;

    switch (status) {
      case BookingStatus.upcoming:
        label = StaticString.upcomingBadge.tr;
        bgColor = const Color(0xFFE8F5E9);
        textColor = AppColors.primaryColor;
        break;
      case BookingStatus.completed:
        label = StaticString.tabCompleted.tr;
        bgColor = const Color(0xFFEFF6FF);
        textColor = const Color(0xFF2563EB);
        break;
      case BookingStatus.cancelled:
        label = StaticString.tabCancelled.tr;
        bgColor = const Color(0xFFFEF2F2);
        textColor = const Color(0xFFEF4444);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.5.sp,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
