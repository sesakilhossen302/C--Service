import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Customer/Booking/HelpSupportScreen/help_support_screen.dart';
import '../../ProviderHomeScreen/provider_home_screen.dart';
import '../../ProviderIncomeScreen/provider_income_screen.dart';
import '../../ProviderProfileScreen/provider_profile_screen.dart';
import '../../ProviderTaskScreen/provider_task_screen.dart';

class ProviderNavBarController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    const ProviderHomeScreen(),
    const ProviderTaskScreen(),
    const ProviderIncomeScreen(),
    const HelpSupportScreen(),
    const ProviderProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
