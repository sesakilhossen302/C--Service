import 'package:flutter/material.dart';
import '../../../../Core/AppRoute/app_route.dart';

class OnbordingController {
  void onLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.loginScreen);
  }

  void onRegisterPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.signupScreen);
  }

  void onServiceProviderLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.serviceProviderSignupScreen);
  }

  void onExploreNowPressed(BuildContext context) {
    // Handle Explore Now action
  }
}
