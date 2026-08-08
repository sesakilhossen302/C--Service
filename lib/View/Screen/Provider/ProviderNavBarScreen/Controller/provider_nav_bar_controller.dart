import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Customer/Booking/HelpSupportScreen/help_support_screen.dart';
import '../../ProviderHomeScreen/provider_home_screen.dart';
import '../../ProviderIncomeScreen/provider_income_screen.dart';
import '../../ProviderTaskScreen/provider_task_screen.dart';

class ProviderNavBarController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    const ProviderHomeScreen(),
    const ProviderTaskScreen(),
    const ProviderIncomeScreen(),
    const HelpSupportScreen(),
    const Center(child: Text('প্রোফাইল স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
