import 'package:get/get.dart';
import '../../View/Screen/Customer/Booking/BookingReviewScreen/booking_review_screen.dart';
import '../../View/Screen/Customer/Booking/BookingSuccessScreen/booking_success_screen.dart';
import '../../View/Screen/Customer/Booking/PaymentScreen/payment_screen.dart';
import '../../View/Screen/Customer/Booking/SelectAddressScreen/select_address_screen.dart';
import '../../View/Screen/Customer/Booking/SelectDateTimeScreen/select_date_time_screen.dart';
import '../../View/Screen/Customer/CustomerHomeScreen/customer_home_screen.dart';
import '../../View/Screen/Customer/CustomerNavBarScreen/customer_nav_bar_screen.dart';
import '../../View/Screen/Customer/HomePassportScreen/home_passport_screen.dart';
import '../../View/Screen/Customer/HomeTimelineScreen/home_timeline_screen.dart';
import '../../View/Screen/Customer/MyReviewsScreen/my_reviews_screen.dart';
import '../../View/Screen/Customer/SearchServiceScreen/search_service_screen.dart';
import '../../View/Screen/Customer/ServiceDetailsScreen/service_details_screen.dart';
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
  static const String searchServiceScreen = '/search_service_screen';
  static const String homeTimelineScreen = '/home_timeline_screen';
  static const String homePassportScreen = '/home_passport_screen';
  static const String myReviewsScreen = '/my_reviews_screen';
  static const String serviceDetailsScreen = '/service_details_screen';
  static const String selectAddressScreen = '/select_address_screen';
  static const String selectDateTimeScreen = '/select_date_time_screen';
  static const String bookingReviewScreen = '/booking_review_screen';
  static const String paymentScreen = '/payment_screen';
  static const String bookingSuccessScreen = '/booking_success_screen';

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
    GetPage(name: searchServiceScreen, page: () => const SearchServiceScreen()),
    GetPage(name: homeTimelineScreen, page: () => const HomeTimelineScreen()),
    GetPage(name: homePassportScreen, page: () => const HomePassportScreen()),
    GetPage(name: myReviewsScreen, page: () => const MyReviewsScreen()),
    GetPage(name: serviceDetailsScreen, page: () => const ServiceDetailsScreen()),
    GetPage(name: selectAddressScreen, page: () => const SelectAddressScreen()),
    GetPage(name: selectDateTimeScreen, page: () => const SelectDateTimeScreen()),
    GetPage(name: bookingReviewScreen, page: () => const BookingReviewScreen()),
    GetPage(name: paymentScreen, page: () => const PaymentScreen()),
    GetPage(name: bookingSuccessScreen, page: () => const BookingSuccessScreen()),
  ];
}
