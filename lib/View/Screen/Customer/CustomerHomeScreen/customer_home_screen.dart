import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/customer_home_controller.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerHomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),

              // 1. Top Header Row (Greeting, Name, Location & Notification Bell)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            StaticString.greeting,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        StaticString.userName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14.sp,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            StaticString.location,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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

              // 2. Search Input Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.cardBorder, width: 1.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(8),
                      blurRadius: 10.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: StaticString.searchHint,
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
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // 3. AI Assistant Banner (Green Card)
              Container(
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withAlpha(60),
                      blurRadius: 14.r,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StaticString.aiTitle,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: controller.onChatNowPressed,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                StaticString.chatNow,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 12.w),

                    // Robot Icon Box
                    Container(
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.smart_toy_outlined,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // 4. Quick Pills Navigation Row (Timeline, Passport, Reviews)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickPill(
                    icon: Icons.timeline_rounded,
                    label: StaticString.timeline,
                  ),
                  _buildQuickPill(
                    icon: Icons.badge_outlined,
                    label: StaticString.homePassport,
                  ),
                  _buildQuickPill(
                    icon: Icons.star_border_rounded,
                    label: StaticString.reviews,
                  ),
                ],
              ),

              SizedBox(height: 28.h),

              // 5. Popular Services Section Header
              _buildSectionHeader(
                title: StaticString.popularServices,
                onSeeAllTap: () {},
              ),

              SizedBox(height: 14.h),

              // 4 Columns Grid of Popular Services
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.popularServices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = controller.popularServices[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                      border: Border.all(color: AppColors.cardBorder, width: 1.w),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.iconEmoji,
                          style: TextStyle(fontSize: 26.sp),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
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

              // 6. Upcoming Services Section Header
              _buildSectionHeader(
                title: StaticString.upcomingServices,
                onSeeAllTap: () {},
              ),

              SizedBox(height: 14.h),

              // Upcoming Service Booking Card
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.cardBorder, width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.upcomingBooking.serviceTitle,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withAlpha(20),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            controller.upcomingBooking.status,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 14.sp, color: AppColors.textGrey),
                        SizedBox(width: 4.w),
                        Text(
                          controller.upcomingBooking.dateText,
                          style: TextStyle(fontSize: 12.5.sp, color: AppColors.textGrey),
                        ),
                        SizedBox(width: 14.w),
                        Icon(Icons.access_time_rounded, size: 14.sp, color: AppColors.textGrey),
                        SizedBox(width: 4.w),
                        Text(
                          controller.upcomingBooking.timeText,
                          style: TextStyle(fontSize: 12.5.sp, color: AppColors.textGrey),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 42.h,
                            child: ElevatedButton(
                              onPressed: controller.onTrackServicePressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                StaticString.trackService,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: SizedBox(
                            height: 42.h,
                            child: OutlinedButton(
                              onPressed: controller.onServiceDetailsPressed,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.textColor,
                                side: BorderSide(color: AppColors.cardBorder, width: 1.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                StaticString.details,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
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

              SizedBox(height: 28.h),

              // 7. Categories Section Header
              _buildSectionHeader(
                title: StaticString.categories,
                onSeeAllTap: () {},
              ),

              SizedBox(height: 14.h),

              // 2x2 Grid of Categories
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 2.2,
                ),
                itemBuilder: (context, index) {
                  final cat = controller.categories[index];
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
                          cat.iconEmoji,
                          style: TextStyle(fontSize: 24.sp),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cat.title,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                cat.countText,
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 28.h),

              // 8. HomeCare Prime Offer Banner (Gold Card)
              Container(
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 12.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF59E0B),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StaticString.primeTitle,
                            style: TextStyle(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            StaticString.primeSubtitle,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: AppColors.textLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: controller.onJoinPrimePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59E0B),
                        foregroundColor: AppColors.textColor,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Text(
                        StaticString.joinNow,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 28.h),

              // 9. Why HomeCare OS? Section Card
              Text(
                StaticString.whyHomeCare,
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
                  children: [
                    _buildWhyFeatureRow(
                      icon: Icons.verified_user_outlined,
                      title: StaticString.trustedProf,
                      subtitle: StaticString.trustedProfSub,
                    ),
                    Divider(color: AppColors.cardBorder, height: 24.h),
                    _buildWhyFeatureRow(
                      icon: Icons.bolt_outlined,
                      title: StaticString.fastService,
                      subtitle: StaticString.fastServiceSub,
                    ),
                    Divider(color: AppColors.cardBorder, height: 24.h),
                    _buildWhyFeatureRow(
                      icon: Icons.thumb_up_alt_outlined,
                      title: StaticString.satisfactionGar,
                      subtitle: StaticString.satisfactionGarSub,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickPill({required IconData icon, required String label}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.cardBorder, width: 1.w),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 22.sp),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
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

  Widget _buildWhyFeatureRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(20),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryColor, size: 20.sp),
        ),
        SizedBox(width: 14.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
