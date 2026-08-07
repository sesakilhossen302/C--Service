import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AllServicesScreen/all_services_screen.dart';
import '../../Booking/HelpSupportScreen/help_support_screen.dart';
import '../../Booking/MyBookingsScreen/my_bookings_screen.dart';
import '../../CustomerHomeScreen/customer_home_screen.dart';
import '../../CustomerProfileScreen/customer_profile_screen.dart';

class CustomerNavBarController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    const CustomerHomeScreen(),
    const AllServicesScreen(),
    const MyBookingsScreen(),
    const HelpSupportScreen(),
    const CustomerProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
