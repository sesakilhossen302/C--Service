import 'package:flutter/material.dart';
import '../../View/Screen/ForgotPasswordScreen/forgot_password_screen.dart';
import '../../View/Screen/LoginScreen/login_screen.dart';
import '../../View/Screen/OnbordingScreen/onbording_screen.dart';
import '../../View/Screen/OtpScreen/otp_screen.dart';
import '../../View/Screen/ServiceProviderSignupScreen/service_provider_signup_screen.dart';
import '../../View/Screen/SignupScreen/signup_screen.dart';
import '../../View/Screen/SplashScreen/splash_screen.dart';

class AppRoute {
  static const String splashScreen = '/splash_screen';
  static const String onbordingScreen = '/onbording_screen';
  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String serviceProviderSignupScreen = '/service_provider_signup_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String otpScreen = '/otp_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onbordingScreen: (context) => const OnbordingScreen(),
    loginScreen: (context) => const LoginScreen(),
    signupScreen: (context) => const SignupScreen(),
    serviceProviderSignupScreen: (context) => const ServiceProviderSignupScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    otpScreen: (context) => const OtpScreen(),
  };
}
