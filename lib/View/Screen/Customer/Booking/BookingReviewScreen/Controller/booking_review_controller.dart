import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../Model/booking_review_model.dart';

class BookingReviewController extends GetxController {
  final reviewData = BookingReviewDataModel(
    serviceSummary: BookingServiceSummaryModel(
      serviceTitle: 'এসি ক্লিনিং',
      durationText: '১-২ ঘণ্টা',
      iconEmoji: '❄️',
    ),
    addressSummary: BookingAddressSummaryModel(
      title: 'বাড়ি',
      fullAddress: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি, ঢাকা ১২০৯',
    ),
    dateTimeSummary: BookingDateTimeSummaryModel(
      dateText: 'আজ, ৩ জুলাই',
      timeText: 'সকাল ১০:০০',
    ),
    priceBreakdown: BookingPriceBreakdownModel(
      servicePrice: 600,
      travelCharge: 0,
    ),
  ).obs;

  @override
  void onInit() {
    super.onInit();
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      final dateText = args['date'] ?? reviewData.value.dateTimeSummary.dateText;
      final timeText = args['time'] ?? reviewData.value.dateTimeSummary.timeText;

      reviewData.update((val) {
        if (val != null) {
          val.dateTimeSummary = BookingDateTimeSummaryModel(
            dateText: dateText,
            timeText: timeText,
          );
        }
      });
    }
  }

  void onChangeService() {
    Get.back();
  }

  void onChangeAddress() {
    Get.back();
  }

  void onChangeDateTime() {
    Get.back();
  }

  void onProceedToPayment() {
    Get.toNamed(AppRoute.paymentScreen);
  }
}
