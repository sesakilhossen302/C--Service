import 'package:get/get.dart';
import '../../View/Screen/Customer/CustomerHomeScreen/customer_home_screen.dart';
import '../../View/Screen/Customer/CustomerNavBarScreen/customer_nav_bar_screen.dart';
import '../../View/Screen/ForgotPasswordScreen/forgot_password_screen.dart';
import '../../View/Screen/LoginScreen/login_screen.dart';
import '../../View/Screen/NotificationScreen/notification_screen.dart';
import '../../View/Screen/OnbordingScreen/onbording_screen.dart';
import '../../View/Screen/OtpScreen/otp_screen.dart';
import '../../View/Screen/Provider/ProviderHomeScreen/provider_home_screen.dart';
import '../../View/Screen/Provider/ProviderNavBarScreen/provider_nav_bar_screen.dart';
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
  static const String customerHomeScreen = '/customer_home_screen';
  static const String providerHomeScreen = '/provider_home_screen';
  static const String customerNavBarScreen = '/customer_nav_bar_screen';
  static const String providerNavBarScreen = '/provider_nav_bar_screen';
  static const String notificationScreen = '/notification_screen';

  static List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onbordingScreen, page: () => const OnbordingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(name: serviceProviderSignupScreen, page: () => const ServiceProviderSignupScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: otpScreen, page: () => const OtpScreen()),
    GetPage(name: customerHomeScreen, page: () => const CustomerHomeScreen()),
    GetPage(name: providerHomeScreen, page: () => const ProviderHomeScreen()),
    GetPage(name: customerNavBarScreen, page: () => const CustomerNavBarScreen()),
    GetPage(name: providerNavBarScreen, page: () => const ProviderNavBarScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
  ];
}
