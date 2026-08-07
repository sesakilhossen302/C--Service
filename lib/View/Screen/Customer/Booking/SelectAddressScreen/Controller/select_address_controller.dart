import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../Model/select_address_model.dart';

class SelectAddressController extends GetxController {
  final selectedAddressId = '1'.obs;

  final savedAddresses = <SavedAddressModel>[
    SavedAddressModel(
      id: '1',
      title: 'বাড়ি',
      fullAddress: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি, ঢাকা ১২০৯',
      isDefault: true,
      iconType: 'home',
    ),
    SavedAddressModel(
      id: '2',
      title: 'অফিস',
      fullAddress: 'ফ্লোর ৬, আফতাব টাওয়ার, কারওয়ান বাজার, ঢাকা ১২১৫',
      isDefault: false,
      iconType: 'office',
    ),
  ].obs;

  final newAddressController = TextEditingController();

  void selectAddress(String id) {
    selectedAddressId.value = id;
  }

  void removeAddress(String id) {
    savedAddresses.removeWhere((item) => item.id == id);
    if (selectedAddressId.value == id && savedAddresses.isNotEmpty) {
      selectedAddressId.value = savedAddresses.first.id;
    }
  }

  void openAddDialog() {
    newAddressController.text = 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি';
  }

  void saveNewAddress() {
    final text = newAddressController.text.trim();
    if (text.isNotEmpty) {
      final newId = DateTime.now().millisecondsSinceEpoch.toString();
      savedAddresses.add(
        SavedAddressModel(
          id: newId,
          title: 'নতুন ঠিকানা',
          fullAddress: text,
          isDefault: false,
          iconType: 'home',
        ),
      );
      selectedAddressId.value = newId;
    }
    Get.back();
  }

  void onNextPressed() {
    Get.toNamed(AppRoute.selectDateTimeScreen);
  }

  @override
  void onClose() {
    newAddressController.dispose();
    super.onClose();
  }
}
