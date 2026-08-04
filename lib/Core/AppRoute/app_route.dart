import 'package:flutter/material.dart';
import '../../View/Screen/OnbordingScreen/onbording_screen.dart';
import '../../View/Screen/SplashScreen/splash_screen.dart';

class AppRoute {
  static const String splashScreen = '/splash_screen';
  static const String onbordingScreen = '/onbording_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onbordingScreen: (context) => const OnbordingScreen(),
  };
}
