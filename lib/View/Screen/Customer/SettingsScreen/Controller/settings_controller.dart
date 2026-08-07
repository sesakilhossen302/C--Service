import 'package:get/get.dart';
import '../../../../../Core/AppRoute/app_route.dart';

class SettingsController extends GetxController {
  final isPushEnabled = true.obs;
  final isSmsEnabled = false.obs;
  final currentLanguage = 'বাংলা'.obs;
  final appVersion = 'v1.2.0';

  void togglePush(bool value) {
    isPushEnabled.value = value;
  }

  void toggleSms(bool value) {
    isSmsEnabled.value = value;
  }

  void onChangeLanguageTap() {
    Get.toNamed(AppRoute.changeLanguageScreen);
  }
}
