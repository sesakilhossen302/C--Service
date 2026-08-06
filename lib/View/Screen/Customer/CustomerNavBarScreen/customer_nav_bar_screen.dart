import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/customer_nav_bar_controller.dart';

class CustomerNavBarScreen extends StatelessWidget {
  const CustomerNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerNavBarController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
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
          child: Container(
            height: 64.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home_rounded,
                    label: StaticString.navHome,
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icons.inventory_2_outlined,
                    activeIcon: Icons.inventory_2_rounded,
                    label: StaticString.navService,
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.calendar_today_outlined,
                    activeIcon: Icons.calendar_today_rounded,
                    label: StaticString.navBooking,
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 3,
                    icon: Icons.help_outline_rounded,
                    activeIcon: Icons.help_rounded,
                    label: StaticString.navHelp,
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 4,
                    icon: Icons.person_outline_rounded,
                    activeIcon: Icons.person_rounded,
                    label: StaticString.navProfile,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required CustomerNavBarController controller,
  }) {
    final isSelected = controller.selectedIndex.value == index;
    final color = isSelected ? AppColors.primaryColor : AppColors.textLightGrey;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: color,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
