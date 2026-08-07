import 'package:get/get.dart';
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

  void selectLanguage(String code) {
    for (int i = 0; i < languages.length; i++) {
      languages[i] = languages[i].copyWith(isSelected: languages[i].code == code);
    }
  }

  void onSaveLanguage() {
    final selected = languages.firstWhere((l) => l.isSelected, orElse: () => languages.first);
    Get.snackbar('ভাষা পরিবর্তিত', 'অ্যাপের ভাষা "${selected.nativeTitle}" এ নির্ধারণ করা হয়েছে।');
    Get.back();
  }
}
