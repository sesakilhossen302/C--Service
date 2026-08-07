import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController(text: 'সাকিব আহমেদ');
  final mobileController = TextEditingController(text: '01712-345678');
  final emailController = TextEditingController(text: 'sakib@email.com');
  final addressController = TextEditingController(text: 'ধানমন্ডি, ঢাকা');

  final avatarInitial = 'স'.obs;

  void onPickAvatar() {
    Get.snackbar('ছবি পরিবর্তন', 'প্রোফাইল ছবি গ্যালারি থেকে আপলোড করুন।');
  }

  void onSaveProfile() {
    Get.snackbar('সফল!', 'আপনার প্রোফাইল তথ্য সফলভাবে আপডেট হয়েছে।');
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
