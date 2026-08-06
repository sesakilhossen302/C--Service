import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/home_passport_model.dart';

class HomePassportController extends GetxController {
  final passportInfo = HomePassportInfoModel(
    houseTitle: 'সাকিব আহমেদের বাড়ি',
    healthScore: '৭৮/১০০',
    totalServices: '২৪',
    thisMonthServices: '৩',
    totalSavings: '৳২,৪০০',
    address: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
    propertyType: 'অ্যাপার্টমেন্ট',
    propertySize: '১২০০ বর্গফুট',
    rooms: '৩ বেডরুম, ২ বাথরুম',
    registrationDate: 'জানুয়ারি ২০২৫',
  ).obs;

  final recommendations = <SmartRecommendationModel>[
    SmartRecommendationModel(
      title: 'এসি ফিল্টার পরিষ্কার',
      priceText: '৳৬০০',
      iconEmoji: '❄️',
    ),
    SmartRecommendationModel(
      title: 'সোফা গভীর পরিষ্কার',
      priceText: '৳৮০০',
      iconEmoji: '🛋️',
    ),
  ].obs;

  // Controllers for Edit Modal
  final addressController = TextEditingController();
  final typeController = TextEditingController();
  final sizeController = TextEditingController();
  final roomsController = TextEditingController();
  final regDateController = TextEditingController();

  void openEditDialog() {
    addressController.text = passportInfo.value.address;
    typeController.text = passportInfo.value.propertyType;
    sizeController.text = passportInfo.value.propertySize;
    roomsController.text = passportInfo.value.rooms;
    regDateController.text = passportInfo.value.registrationDate;
  }

  void saveEditChanges() {
    passportInfo.update((val) {
      if (val != null) {
        val.address = addressController.text;
        val.propertyType = typeController.text;
        val.propertySize = sizeController.text;
        val.rooms = roomsController.text;
        val.registrationDate = regDateController.text;
      }
    });
    Get.back();
  }

  @override
  void onClose() {
    addressController.dispose();
    typeController.dispose();
    sizeController.dispose();
    roomsController.dispose();
    regDateController.dispose();
    super.onClose();
  }
}
