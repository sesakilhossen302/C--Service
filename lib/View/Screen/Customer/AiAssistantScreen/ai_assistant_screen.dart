import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/ai_assistant_controller.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AiAssistantController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Dark Green Header Bar (From screenshot)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Row(
                children: [
                  const CustomBackButton(iconColor: Colors.white),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StaticString.aiAssistantTitle.tr,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          StaticString.aiAssistantSub.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Top Right Bot Avatar Icon Box
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(40),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.smart_toy_rounded,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
            ),

            // 2. Horizontal Quick Suggestion Chips Row (From screenshot)
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: controller.quickChips.map((chipKey) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () => controller.onChipTap(chipKey),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD1FAE5),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            chipKey.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF065F46),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const Divider(height: 1, color: Color(0xFFF3F4F6)),

            // 3. Chat Messages List
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: controller.scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    if (message.isUser) {
                      return _buildUserBubble(message.text);
                    } else {
                      return _buildBotBubble(message.text);
                    }
                  },
                ),
              ),
            ),

            // 4. Bottom Message Input Bar (From screenshot)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(8),
                    blurRadius: 8.r,
                    offset: Offset(0, -2.h),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Text Input Box
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: TextField(
                        controller: controller.messageController,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: StaticString.writeMessageHint.tr,
                          hintStyle: TextStyle(
                            fontSize: 13.5.sp,
                            color: AppColors.textLightGrey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 12.h,
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (val) => controller.sendMessage(val),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),

                  // Send Button Box
                  GestureDetector(
                    onTap: () => controller.sendMessage(controller.messageController.text),
                    child: Container(
                      width: 46.w,
                      height: 46.h,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bot Message Bubble Builder
  Widget _buildBotBubble(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bot Icon Avatar
          Container(
            width: 36.w,
            height: 36.h,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smart_toy_rounded,
              color: Colors.white,
              size: 20.sp,
            ),
          ),

          SizedBox(width: 10.w),

          // Message Bubble
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(18.r),
                  bottomLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  color: AppColors.textColor,
                  height: 1.45,
                ),
              ),
            ),
          ),

          SizedBox(width: 40.w),
        ],
      ),
    );
  }

  // User Message Bubble Builder
  Widget _buildUserBubble(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 50.w),

          // Message Bubble
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(4.r),
                  bottomLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  color: Colors.white,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
