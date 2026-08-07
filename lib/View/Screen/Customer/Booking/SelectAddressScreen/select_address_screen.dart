import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/select_address_controller.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectAddressController());

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
                    'ঠিকানা নির্বাচন',
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

            // 2. Booking Step Progress Indicator Bar (ঠিকানা, সময়, রিভিউ, পেমেন্ট)
            _buildStepProgressIndicator(),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title: সংরক্ষিত ঠিকানা
                    Text(
                      'সংরক্ষিত ঠিকানা',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Saved Address Cards List
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.savedAddresses.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final item = controller.savedAddresses[index];
                          return Obx(() {
                            final isSelected =
                                controller.selectedAddressId.value == item.id;
                            return GestureDetector(
                              onTap: () => controller.selectAddress(item.id),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.all(16.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.cardBorder,
                                    width: isSelected ? 1.5.w : 1.w,
                                  ),
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
                                    // Left Location Icon Box
                                    Container(
                                      width: 46.w,
                                      height: 46.h,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.primaryColor
                                            : const Color(0xFFE8F5E9),
                                        borderRadius: BorderRadius.circular(
                                          14.r,
                                        ),
                                      ),
                                      child: Icon(
                                        isSelected
                                            ? Icons.location_on_rounded
                                            : Icons.location_on_outlined,
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.primaryColor,
                                        size: 22.sp,
                                      ),
                                    ),

                                    SizedBox(width: 14.w),

                                    // Address Details Column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColor,
                                            ),
                                          ),
                                          SizedBox(height: 3.h),
                                          Text(
                                            item.fullAddress,
                                            style: TextStyle(
                                              fontSize: 12.5.sp,
                                              color: AppColors.textGrey,
                                              height: 1.3,
                                            ),
                                          ),
                                          if (item.isDefault) ...[
                                            SizedBox(height: 4.h),
                                            Text(
                                              'ডিফল্ট',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 8.w),

                                    // Right Action Icon (Checkmark if selected, else Delete icon)
                                    if (isSelected)
                                      Icon(
                                        Icons.check_rounded,
                                        color: AppColors.primaryColor,
                                        size: 22.sp,
                                      )
                                    else if (!item.isDefault)
                                      GestureDetector(
                                        onTap: () =>
                                            controller.removeAddress(item.id),
                                        child: Icon(
                                          Icons.delete_outline_rounded,
                                          color: const Color(0xFFEF4444),
                                          size: 20.sp,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // "নতুন ঠিকানা যোগ করুন" Dotted Card
                    GestureDetector(
                      onTap: () {
                        controller.openAddDialog();
                        _showAddAddressModal(context, controller);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(
                            color: AppColors.primaryColor.withAlpha(120),
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'নতুন ঠিকানা যোগ করুন',
                              style: TextStyle(
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
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
                      'পরবর্তী',
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
    final steps = ['ঠিকানা', 'সময়', 'রিভিউ', 'পেমেন্ট'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isCurrent = index == 0;

          return Expanded(
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isCurrent
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
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCurrent
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

  // Add Address Dialog Modal (Exact Match to Image 2)
  void _showAddAddressModal(
    BuildContext context,
    SelectAddressController controller,
  ) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'যোগ করুন',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 18.h),

              // Address Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ঠিকানা',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextField(
                    controller: controller.newAddressController,
                    style: TextStyle(fontSize: 13.5.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 12.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: AppColors.cardBorder,
                          width: 1.w,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: AppColors.cardBorder,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.5.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 22.h),

              // Action Buttons Row (Cancel & Save)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46.h,
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.2.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          'বাতিল করুন',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: SizedBox(
                      height: 46.h,
                      child: ElevatedButton(
                        onPressed: controller.saveNewAddress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          'সংরক্ষণ করুন',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
