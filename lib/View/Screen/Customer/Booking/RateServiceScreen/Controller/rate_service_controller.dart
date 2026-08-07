import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
import '../Model/rate_service_model.dart';

class RateServiceController extends GetxController {
  final selectedRating = 0.obs;
  final commentController = TextEditingController();

  final tags = <FeedbackTagModel>[
    FeedbackTagModel(id: '1', label: 'সময়মতো'),
    FeedbackTagModel(id: '2', label: 'পরিষ্কার কাজ'),
    FeedbackTagModel(id: '3', label: 'বিনম্র'),
    FeedbackTagModel(id: '4', label: 'দক্ষ'),
    FeedbackTagModel(id: '5', label: 'সরঞ্জাম নিজের'),
  ].obs;

  void setRating(int rating) {
    selectedRating.value = rating;
  }

  void toggleTag(String id) {
    final index = tags.indexWhere((item) => item.id == id);
    if (index != -1) {
      tags[index] = tags[index].copyWith(isSelected: !tags[index].isSelected);
    }
  }

  void onSubmitRating() {
    CustomSnackbar.showSuccess(
      title: 'ধন্যবাদ!',
      message: 'আপনার মূল্যবান ফিডব্যাক সফলভাবে জমা নেওয়া হয়েছে।',
    );
    Get.offAllNamed(AppRoute.customerNavBarScreen);
  }

  void onSkip() {
    Get.offAllNamed(AppRoute.customerNavBarScreen);
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}
