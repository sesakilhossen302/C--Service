import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Header (Greeting, Provider Name & Notification Bell)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        StaticString.providerGreeting,
                        style: TextStyle(
                          fontSize: 13.5,
                          color: AppColors.textLightGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        StaticString.providerName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),

                  // Notification Bell with Red Badge
                  Stack(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonSecondaryBg,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: AppColors.textColor,
                          size: 22,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // 2. Online Status Banner Card with Custom Toggle
              Obx(
                () {
                  final isOnline = controller.isOnline.value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isOnline ? AppColors.primaryColor : const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: isOnline
                          ? [
                              BoxShadow(
                                color: AppColors.primaryColor.withAlpha(40),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
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
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: isOnline ? Colors.white : const Color(0xFF9CA3AF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isOnline
                                  ? StaticString.onlineReady
                                  : StaticString.offlineStatus,
                              style: TextStyle(
                                fontSize: 14,
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
                            width: 44,
                            height: 24,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: isOnline
                                  ? Colors.white.withAlpha(50)
                                  : const Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isOnline ? Colors.white : const Color(0xFF9CA3AF),
                                width: 1.2,
                              ),
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
                              alignment: isOnline
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: 18,
                                height: 18,
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

              const SizedBox(height: 18),

              // 3. 3 Statistics Cards Row (Income, Completed Work, Rating)
              Row(
                children: [
                  _buildStatCard(
                    value: controller.todayIncome,
                    label: StaticString.todayIncome,
                    valColor: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 10),
                  _buildStatCard(
                    value: controller.completedWorkCount,
                    label: StaticString.completedWork,
                    valColor: const Color(0xFF3B82F6),
                  ),
                  const SizedBox(width: 10),
                  _buildStatCard(
                    value: controller.ratingVal,
                    label: StaticString.ratingLabel,
                    valColor: const Color(0xFFF59E0B),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 4. Today's Tasks Section Header
              _buildSectionHeader(
                title: StaticString.todayTasks,
                onSeeAllTap: () {},
              ),

              const SizedBox(height: 14),

              // Today's Task Cards List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.todayTasks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final task = controller.todayTasks[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.cardBorder, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                task.statusText,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.person_outline_rounded, size: 14, color: AppColors.textGrey),
                            const SizedBox(width: 4),
                            Text(
                              task.customerName,
                              style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textGrey),
                            const SizedBox(width: 4),
                            Text(
                              task.location,
                              style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.access_time_rounded, size: 14, color: AppColors.textGrey),
                                const SizedBox(width: 4),
                                Text(
                                  task.timeText,
                                  style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey),
                                ),
                              ],
                            ),
                            Text(
                              task.priceText,
                              style: const TextStyle(
                                fontSize: 15,
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

              const SizedBox(height: 28),

              // 5. Quick Actions Section Header
              const Text(
                StaticString.quickActions,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              const SizedBox(height: 14),

              // 2x2 Grid of Quick Actions
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.quickActions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.2,
                ),
                itemBuilder: (context, index) {
                  final action = controller.quickActions[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardBorder, width: 1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          action.iconEmoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            action.title,
                            style: const TextStyle(
                              fontSize: 13.5,
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

              const SizedBox(height: 28),

              // 6. This Month's Performance Section Card
              const Text(
                StaticString.monthPerformance,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: Column(
                  children: controller.performanceMetrics.map((metric) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                metric.title,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                metric.valText,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: metric.progressRatio,
                              backgroundColor: AppColors.buttonSecondaryBg,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Section Headers
  Widget _buildSectionHeader({required String title, required VoidCallback onSeeAllTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: const Text(
            StaticString.seeAll,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  // Helper Widget for 3 Stat Cards
  Widget _buildStatCard({
    required String value,
    required String label,
    required Color valColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.cardBorder, width: 1),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: valColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
                color: AppColors.textLightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
