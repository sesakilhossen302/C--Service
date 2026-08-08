import 'package:get/get.dart';
import '../../../../../Core/AppRoute/app_route.dart';

class ProviderProfileController extends GetxController {
  final providerName = 'করিম সাহেব'.obs;
  final providerPhone = '+880 1812-345678'.obs;
  final ratingText = '4.8 • 45 রিভিউ'.obs;

  final totalTasksCount = '১২৪'.obs;
  final thisMonthTasksCount = '১৮'.obs;
  final successRateText = '৯৮%'.obs;

  void onEditProfilePressed() {
    Get.toNamed(AppRoute.editProfileScreen);
  }

  void onReviewsPressed() {
    Get.toNamed(AppRoute.myReviewsScreen);
  }

  void onSettingsPressed() {
    Get.toNamed(AppRoute.settingsScreen);
  }

  void onHelpPressed() {
    Get.toNamed(AppRoute.helpSupportScreen);
  }

  void onLogoutPressed() {
    Get.offAllNamed(AppRoute.onbordingScreen);
  }
}
