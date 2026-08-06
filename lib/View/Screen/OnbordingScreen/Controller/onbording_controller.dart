import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class OnbordingController extends GetxController {
  void onLoginPressed() {
    Get.toNamed(AppRoute.loginScreen);
  }

  void onRegisterPressed() {
    Get.toNamed(AppRoute.signupScreen);
  }

  void onServiceProviderLoginPressed() {
    Get.toNamed(AppRoute.serviceProviderSignupScreen);
  }

  void onExploreNowPressed() {
    Get.toNamed(AppRoute.customerHomeScreen);
  }
}
