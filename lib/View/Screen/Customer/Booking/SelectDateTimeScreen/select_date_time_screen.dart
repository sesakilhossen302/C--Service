import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/select_date_time_controller.dart';

class SelectDateTimeScreen extends StatelessWidget {
  const SelectDateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectDateTimeController());

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
                    StaticString.dateTimeTitle.tr,
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

            // 2. Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট)
            _buildStepProgressIndicator(),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title: তারিখ বেছে নিন
                    Text(
                      StaticString.selectDateTitle.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Horizontal Date Chips Row
                    SizedBox(
                      height: 44.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dates.length,
                        separatorBuilder: (context, index) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) {
                          final item = controller.dates[index];
                          return Obx(() {
                            final isSelected = controller.selectedDateId.value == item.id;
                            return GestureDetector(
                              onTap: () => controller.selectDate(item.id),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primaryColor : Colors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.cardBorder,
                                    width: 1.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(6),
                                      blurRadius: 6.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    item.fullLabel,
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
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

                    SizedBox(height: 24.h),

                    // Section Title: সময় বেছে নিন
                    Text(
                      StaticString.selectTimeTitle.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // 2-Column Time Slots Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.timeSlots.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 2.8,
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.timeSlots[index];
                        return Obx(() {
                          final isSelected = controller.selectedTimeSlotId.value == item.id;
                          return GestureDetector(
                            onTap: () => controller.selectTimeSlot(item.id),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.cardBorder,
                                  width: 1.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(6),
                                    blurRadius: 6.r,
                                    offset: Offset(0, 2.h),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  item.fullLabel,
                                  style: TextStyle(
                                    fontSize: 14.sp,
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

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // 3. Bottom Sticky Action Button (পরবর্তী)
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
                    onPressed: controller.onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      StaticString.next.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট)
  Widget _buildStepProgressIndicator() {
    final steps = [
      StaticString.stepAddress.tr,
      StaticString.stepTime.tr,
      StaticString.stepReview.tr,
      StaticString.stepPayment.tr,
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isCompletedOrActive = index <= 1;

          return Expanded(
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isCompletedOrActive
                        ? AppColors.primaryColor
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: isCompletedOrActive ? FontWeight.bold : FontWeight.normal,
                    color: isCompletedOrActive
                        ? AppColors.primaryColor
                        : AppColors.textLightGrey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
