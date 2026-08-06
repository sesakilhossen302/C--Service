import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/provider_home_controller.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderHomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),

              // 1. Top Header Row (Greeting, Provider Name & Notification Bell)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StaticString.providerGreeting,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.textGrey,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        StaticString.providerName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),

                  // Notification Bell with Red Badge
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.notificationScreen),
                    child: Stack(
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: const BoxDecoration(
                            color: AppColors.buttonSecondaryBg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none_rounded,
                            color: AppColors.textColor,
                            size: 22.sp,
                          ),
                        ),
                        Positioned(
                          right: 8.w,
                          top: 8.h,
                          child: Container(
                            width: 9.w,
                            height: 9.h,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              // 2. Online Status Banner Card with Custom Toggle
              Obx(
                () {
                  final isOnline = controller.isOnline.value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: isOnline ? AppColors.primaryColor : const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: isOnline
                          ? [
                              BoxShadow(
                                color: AppColors.primaryColor.withAlpha(40),
                                blurRadius: 10.r,
                                offset: Offset(0, 4.h),
                              ),
                            ]
                          : [],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: isOnline ? Colors.white : const Color(0xFF9CA3AF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              isOnline
                                  ? StaticString.onlineReady
                                  : StaticString.offlineStatus,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: isOnline ? Colors.white : const Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),

                        // Custom Toggle Switch
                        GestureDetector(
                          onTap: controller.toggleOnlineStatus,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: 44.w,
                            height: 24.h,
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                              color: isOnline
                                  ? Colors.white.withAlpha(50)
                                  : const Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: isOnline ? Colors.white : const Color(0xFF9CA3AF),
                                width: 1.2.w,
                              ),
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
                              alignment: isOnline
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  color: isOnline ? Colors.white : const Color(0xFF9CA3AF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 18.h),

              // 3. 3 Statistics Cards Row (Income, Completed Work, Rating)
              Row(
                children: [
                  _buildStatCard(
                    value: controller.todayIncome,
                    label: StaticString.todayIncome,
                    valColor: AppColors.primaryColor,
                  ),
                  SizedBox(width: 10.w),
                  _buildStatCard(
                    value: controller.completedWorkCount,
                    label: StaticString.completedWork,
                    valColor: const Color(0xFF3B82F6),
                  ),
                  SizedBox(width: 10.w),
                  _buildStatCard(
                    value: controller.ratingVal,
                    label: StaticString.ratingLabel,
                    valColor: const Color(0xFFF59E0B),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // 4. Today's Tasks Section Header
              _buildSectionHeader(
                title: StaticString.todayTasks,
                onSeeAllTap: () {},
              ),

              SizedBox(height: 14.h),

              // Today's Task Cards List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.todayTasks.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final task = controller.todayTasks[index];
                  return Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                      border: Border.all(color: AppColors.cardBorder, width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                task.statusText,
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.person_outline_rounded, size: 14.sp, color: AppColors.textGrey),
                            SizedBox(width: 4.w),
                            Text(
                              task.customerName,
                              style: TextStyle(fontSize: 12.5.sp, color: AppColors.textGrey),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 14.sp, color: AppColors.textGrey),
                            SizedBox(width: 4.w),
                            Text(
                              task.location,
                              style: TextStyle(fontSize: 12.5.sp, color: AppColors.textGrey),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time_rounded, size: 14.sp, color: AppColors.textGrey),
                                SizedBox(width: 4.w),
                                Text(
                                  task.timeText,
                                  style: TextStyle(fontSize: 12.5.sp, color: AppColors.textGrey),
                                ),
                              ],
                            ),
                            Text(
                              task.priceText,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 28.h),

              // 5. Quick Actions Section Header
              Text(
                StaticString.quickActions,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 14.h),

              // 2x2 Grid of Quick Actions
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.quickActions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 2.2,
                ),
                itemBuilder: (context, index) {
                  final action = controller.quickActions[index];
                  return Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.cardBorder, width: 1.w),
                    ),
                    child: Row(
                      children: [
                        Text(
                          action.iconEmoji,
                          style: TextStyle(fontSize: 24.sp),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            action.title,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 28.h),

              // 6. This Month's Performance Section Card
              Text(
                StaticString.monthPerformance,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 14.h),

              Container(
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.cardBorder, width: 1.w),
                ),
                child: Column(
                  children: controller.performanceMetrics.map((metric) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                metric.title,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textColor,
                                ),
                              ),
                              Text(
                                '${(metric.progressRatio * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: LinearProgressIndicator(
                              value: metric.progressRatio,
                              minHeight: 8.h,
                              backgroundColor: AppColors.buttonSecondaryBg,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required Color valColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.cardBorder, width: 1.w),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: valColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5.sp,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onSeeAllTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Text(
            StaticString.seeAll,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
