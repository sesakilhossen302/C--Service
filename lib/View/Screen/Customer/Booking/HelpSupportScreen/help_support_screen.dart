import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/help_support_controller.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpSupportController());

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
                    'সাহায্য ও সহায়তা',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Main Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2 Columns Support Action Cards
                    Row(
                      children: [
                        // Card 1: লাইভ চ্যাট
                        Expanded(
                          child: GestureDetector(
                            onTap: controller.onLiveChat,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
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
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.chat_bubble_outline_rounded,
                                      color: AppColors.primaryColor,
                                      size: 22.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'লাইভ চ্যাট',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'এখনই চ্যাট করুন',
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 14.w),

                        // Card 2: কল করুন
                        Expanded(
                          child: GestureDetector(
                            onTap: controller.onCallSupport,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
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
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEFF6FF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.phone_outlined,
                                      color: const Color(0xFF2563EB),
                                      size: 22.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'কল করুন',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '09678-123456',
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Section Title: সচরাচর জিজ্ঞাসা
                    Text(
                      'সচরাচর জিজ্ঞাসা',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // FAQ Accordion Cards List
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.faqs.length,
                        separatorBuilder: (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final faq = controller.faqs[index];
                          return GestureDetector(
                            onTap: () => controller.toggleFaq(faq.id),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18.r),
                                border: Border.all(color: AppColors.cardBorder, width: 1.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(6),
                                    blurRadius: 6.r,
                                    offset: Offset(0, 2.h),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          faq.question,
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        faq.isExpanded
                                            ? Icons.keyboard_arrow_up_rounded
                                            : Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.textLightGrey,
                                        size: 22.sp,
                                      ),
                                    ],
                                  ),
                                  if (faq.isExpanded) ...[
                                    SizedBox(height: 10.h),
                                    Text(
                                      faq.answer,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: const Color(0xFF4B5563),
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
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
          ],
        ),
      ),
    );
  }
}
