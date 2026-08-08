import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/provider_task_controller.dart';
import 'Model/provider_task_model.dart';

class ProviderTaskScreen extends StatelessWidget {
  const ProviderTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderTaskController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            // 1. Header Title: কাজের তালিকা
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                StaticString.taskListTitle.tr,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // 2. Filter Tabs Header Bar (চলমান, আসন্ন, সম্পন্ন)
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
              ),
              child: Obx(
                () => Row(
                  children: [
                    _buildTabItem(
                      index: 0,
                      label: StaticString.tabOngoing.tr,
                      controller: controller,
                    ),
                    _buildTabItem(
                      index: 1,
                      label: StaticString.tabUpcoming.tr,
                      controller: controller,
                    ),
                    _buildTabItem(
                      index: 2,
                      label: StaticString.tabCompleted.tr,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),

            // 3. Task List Items Body
            Expanded(
              child: Obx(
                () {
                  final tasks = controller.filteredTasks;
                  if (tasks.isEmpty) {
                    return Center(
                      child: Text(
                        'কোনো কাজ নেই',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textGrey,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) => SizedBox(height: 14.h),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return _buildTaskCard(task, controller);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter Tab Bar Item Widget
  Widget _buildTabItem({
    required int index,
    required String label,
    required ProviderTaskController controller,
  }) {
    final isSelected = controller.selectedTabIndex.value == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? AppColors.primaryColor : AppColors.textGrey,
                ),
              ),
            ),
            Container(
              height: 2.5.h,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  // Individual Task Card Item Widget (Matching the exact UI design in screenshot)
  Widget _buildTaskCard(ProviderTaskModel task, ProviderTaskController controller) {
    return GestureDetector(
      onTap: () => controller.onTaskTap(task),
      child: Container(
        padding: EdgeInsets.all(16.r),
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
            // Top Row: Service Title & Status Badge Pill
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    task.status,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF065F46),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            // Customer Name Row
            Row(
              children: [
                Icon(
                  Icons.person_outline_rounded,
                  size: 16.sp,
                  color: AppColors.textLightGrey,
                ),
                SizedBox(width: 6.w),
                Text(
                  task.customerName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            // Location Row
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16.sp,
                  color: AppColors.textLightGrey,
                ),
                SizedBox(width: 6.w),
                Text(
                  task.location,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            // Date & Time Row
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 15.sp,
                  color: AppColors.textLightGrey,
                ),
                SizedBox(width: 6.w),
                Text(
                  task.dateText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
                SizedBox(width: 14.w),
                Icon(
                  Icons.access_time_rounded,
                  size: 15.sp,
                  color: AppColors.textLightGrey,
                ),
                SizedBox(width: 6.w),
                Text(
                  task.timeText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),
            const Divider(height: 1, color: Color(0xFFF3F4F6)),
            SizedBox(height: 10.h),

            // Bottom Row: Price & Chevron Arrow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.priceText,
                  style: TextStyle(
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textLightGrey,
                  size: 20.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
