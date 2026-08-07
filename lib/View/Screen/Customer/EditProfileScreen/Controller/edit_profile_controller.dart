import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
import '../Model/edit_profile_model.dart';

class EditProfileController extends GetxController {
  final avatarInitial = 'স'.obs;
  final userInfo = EditProfileDataModel(
    fullName: 'সাকিব আহমেদ',
    mobileNumber: '01712-345678',
    email: 'sakib@email.com',
    address: 'ধানমন্ডি, ঢাকা',
  ).obs;

  late final TextEditingController nameController;
  late final TextEditingController mobileController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController addressController;

  final isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: userInfo.value.fullName);
    mobileController = TextEditingController(text: userInfo.value.mobileNumber);
    phoneController = mobileController;
    emailController = TextEditingController(text: userInfo.value.email);
    addressController = TextEditingController(text: userInfo.value.address);
  }

  void onChangePhoto() {
    CustomSnackbar.showInfo(
      title: 'ছবি পরিবর্তন',
      message: 'প্রোফাইল ছবি গ্যালারি থেকে আপলোড করুন।',
    );
  }

  void onPickAvatar() {
    onChangePhoto();
  }

  void onSaveProfile() {
    CustomSnackbar.showSuccess(
      title: 'সফল!',
      message: 'আপনার প্রোফাইল তথ্য সফলভাবে আপডেট হয়েছে।',
    );
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
