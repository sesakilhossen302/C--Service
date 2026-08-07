import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AllServicesScreen/all_services_screen.dart';
import '../../CustomerHomeScreen/customer_home_screen.dart';

class CustomerNavBarController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    const CustomerHomeScreen(),
    const AllServicesScreen(),
    const Center(child: Text('বুকিং স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('সহায়তা স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('প্রোফাইল স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
