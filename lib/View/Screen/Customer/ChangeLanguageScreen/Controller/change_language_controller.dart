import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../helper/shared_prefe/shared_prefe.dart';
import '../Model/change_language_model.dart';

class ChangeLanguageController extends GetxController {
  final languages = <LanguageOptionModel>[
    LanguageOptionModel(
      code: 'bn',
      nativeTitle: 'বাংলা',
      secondaryTitle: 'Bangla',
      isSelected: true,
    ),
    LanguageOptionModel(
      code: 'en',
      nativeTitle: 'English',
      secondaryTitle: 'ইংরেজি',
      isSelected: false,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    final savedCode = await SharedPrefe.getString(SharedPrefe.languageKey);
    final currentCode = savedCode ?? Get.locale?.languageCode ?? 'bn';
    selectLanguage(currentCode);
  }

  void selectLanguage(String code) {
    for (int i = 0; i < languages.length; i++) {
      languages[i] = languages[i].copyWith(isSelected: languages[i].code == code);
    }
  }

  Future<void> onSaveLanguage() async {
    final selected = languages.firstWhere((l) => l.isSelected, orElse: () => languages.first);
    if (selected.code == 'bn') {
      Get.updateLocale(const Locale('bn', 'BD'));
      await SharedPrefe.setString(SharedPrefe.languageKey, 'bn');
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      await SharedPrefe.setString(SharedPrefe.languageKey, 'en');
    }
    Get.snackbar('ভাষা পরিবর্তিত', 'অ্যাপের ভাষা "${selected.nativeTitle}" এ নির্ধারণ করা হয়েছে।');
    Get.back();
  }
}
