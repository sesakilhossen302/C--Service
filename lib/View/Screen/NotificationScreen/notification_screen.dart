import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CustomBackButton(),
                      SizedBox(width: 14.w),
                      Text(
                        StaticString.notificationsTitle.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: controller.markAllAsRead,
                    child: Text(
                      StaticString.markAllRead.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 6.h),

            // Notification List
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                  itemCount: controller.notifications.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final item = controller.notifications[index];
                    return GestureDetector(
                      onTap: () => controller.markAsRead(index),
                      child: Container(
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: item.isRead
                              ? Colors.white
                              : const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(
                            color: item.isRead
                                ? AppColors.cardBorder
                                : AppColors.primaryColor.withAlpha(40),
                            width: 1.w,
                          ),
                          boxShadow: item.isRead
                              ? []
                              : [
                                  BoxShadow(
                                    color: AppColors.primaryColor.withAlpha(12),
                                    blurRadius: 8.r,
                                    offset: Offset(0, 2.h),
                                  ),
                                ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon Box
                            Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                color: item.iconBgColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item.icon,
                                color: item.iconColor,
                                size: 20.sp,
                              ),
                            ),

                            SizedBox(width: 12.w),

                            // Details Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.title,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                      if (!item.isRead)
                                        Container(
                                          width: 9.w,
                                          height: 9.h,
                                          decoration: const BoxDecoration(
                                            color: AppColors.primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    item.body,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.textGrey,
                                      height: 1.35,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    item.timeText,
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      color: AppColors.textLightGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
