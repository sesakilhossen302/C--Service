import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ProviderHomeScreen/provider_home_screen.dart';

class ProviderNavBarController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    const ProviderHomeScreen(),
    const Center(child: Text('কাজ স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('আয় স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('সহায়তা স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('প্রোফাইল স্ক্রিন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
