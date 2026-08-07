import 'package:get/get.dart';
import '../../View/Screen/Customer/Booking/BookingReviewScreen/booking_review_screen.dart';
import '../../View/Screen/Customer/Booking/BookingSuccessScreen/booking_success_screen.dart';
import '../../View/Screen/Customer/Booking/BookingTrackingScreen/booking_tracking_screen.dart';
import '../../View/Screen/Customer/Booking/ContactUsScreen/contact_us_screen.dart';
import '../../View/Screen/Customer/Booking/HelpSupportScreen/help_support_screen.dart';
import '../../View/Screen/Customer/Booking/MyBookingsScreen/my_bookings_screen.dart';
import '../../View/Screen/Customer/Booking/PaymentScreen/payment_screen.dart';
import '../../View/Screen/Customer/Booking/RateServiceScreen/rate_service_screen.dart';
import '../../View/Screen/Customer/Booking/SelectAddressScreen/select_address_screen.dart';
import '../../View/Screen/Customer/Booking/SelectDateTimeScreen/select_date_time_screen.dart';
import '../../View/Screen/Customer/ChangeLanguageScreen/change_language_screen.dart';
import '../../View/Screen/Customer/CustomerHomeScreen/customer_home_screen.dart';
import '../../View/Screen/Customer/CustomerNavBarScreen/customer_nav_bar_screen.dart';
import '../../View/Screen/Customer/CustomerProfileScreen/customer_profile_screen.dart';
import '../../View/Screen/Customer/EditProfileScreen/edit_profile_screen.dart';
import '../../View/Screen/Customer/HomeCarePrimeScreen/homecare_prime_screen.dart';
import '../../View/Screen/Customer/HomePassportScreen/home_passport_screen.dart';
import '../../View/Screen/Customer/HomeTimelineScreen/home_timeline_screen.dart';
import '../../View/Screen/Customer/MyReviewsScreen/my_reviews_screen.dart';
import '../../View/Screen/Customer/PrivacyPolicyScreen/privacy_policy_screen.dart';
import '../../View/Screen/Customer/ReferralScreen/referral_screen.dart';
import '../../View/Screen/Customer/SearchServiceScreen/search_service_screen.dart';
import '../../View/Screen/Customer/ServiceDetailsScreen/service_details_screen.dart';
import '../../View/Screen/Customer/SettingsScreen/settings_screen.dart';
import '../../View/Screen/Customer/TermsConditionsScreen/terms_conditions_screen.dart';
import '../../View/Screen/ForgotPasswordScreen/forgot_password_screen.dart';
import '../../View/Screen/LoginScreen/login_screen.dart';
import '../../View/Screen/NotificationScreen/notification_screen.dart';
import '../../View/Screen/Customer/AiAssistantScreen/ai_assistant_screen.dart';
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
  static const String bookingTrackingScreen = '/booking_tracking_screen';
  static const String rateServiceScreen = '/rate_service_screen';
  static const String helpSupportScreen = '/help_support_screen';
  static const String contactUsScreen = '/contact_us_screen';
  static const String myBookingsScreen = '/my_bookings_screen';
  static const String customerProfileScreen = '/customer_profile_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String homeCarePrimeScreen = '/homecare_prime_screen';
  static const String referralScreen = '/referral_screen';
  static const String changeLanguageScreen = '/change_language_screen';
  static const String privacyPolicyScreen = '/privacy_policy_screen';
  static const String termsConditionsScreen = '/terms_conditions_screen';
  static const String settingsScreen = '/settings_screen';
  static const String aiAssistantScreen = '/ai_assistant_screen';

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
    GetPage(name: bookingTrackingScreen, page: () => const BookingTrackingScreen()),
    GetPage(name: rateServiceScreen, page: () => const RateServiceScreen()),
    GetPage(name: helpSupportScreen, page: () => const HelpSupportScreen()),
    GetPage(name: contactUsScreen, page: () => const ContactUsScreen()),
    GetPage(name: myBookingsScreen, page: () => const MyBookingsScreen()),
    GetPage(name: customerProfileScreen, page: () => const CustomerProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: homeCarePrimeScreen, page: () => const HomeCarePrimeScreen()),
    GetPage(name: referralScreen, page: () => const ReferralScreen()),
    GetPage(name: changeLanguageScreen, page: () => const ChangeLanguageScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsConditionsScreen, page: () => const TermsConditionsScreen()),
    GetPage(name: settingsScreen, page: () => const SettingsScreen()),
    GetPage(name: aiAssistantScreen, page: () => const AiAssistantScreen()),
  ];
}

