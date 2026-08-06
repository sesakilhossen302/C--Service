import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'Controller/provider_nav_bar_controller.dart';

class ProviderNavBarScreen extends StatelessWidget {
  const ProviderNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderNavBarController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    icon: Icons.work_outline_rounded,
                    activeIcon: Icons.work_rounded,
                    label: StaticString.navTask,
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.account_balance_wallet_outlined,
                    activeIcon: Icons.account_balance_wallet_rounded,
                    label: StaticString.navIncome,
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
    required ProviderNavBarController controller,
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
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
