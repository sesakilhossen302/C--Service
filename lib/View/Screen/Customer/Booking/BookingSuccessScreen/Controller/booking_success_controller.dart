import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../../../CustomerNavBarScreen/Controller/customer_nav_bar_controller.dart';
import '../Model/booking_success_model.dart';

class BookingSuccessController extends GetxController {
  final successData = BookingSuccessModel(
    bookingId: 'BK-1264',
    dateText: 'আজ, ৩ জুলাই',
    timeText: 'সকাল ১০:০০',
    fullAddress: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি, ঢাকা ১২০৯',
  ).obs;

  void onTrackBooking() {
    Get.toNamed(AppRoute.bookingTrackingScreen);
  }

  void onBackToHome() {
    Get.offAllNamed(AppRoute.customerNavBarScreen);
    if (Get.isRegistered<CustomerNavBarController>()) {
      Get.find<CustomerNavBarController>().changeIndex(0);
    }
  }
}
