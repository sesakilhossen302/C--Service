import 'package:get/get.dart';
import '../Model/service_details_model.dart';

class ServiceDetailsController extends GetxController {
  final isFavorite = false.obs;
  late final Rx<ServiceDetailsDataModel> serviceDetails;

  @override
  void onInit() {
    super.onInit();
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;

    final String title = args?['title'] ?? 'এসি ক্লিনিং';
    final String priceText = args?['price'] ?? '৳৬০০';
    final double rating = (args?['rating'] != null) ? (args!['rating'] as num).toDouble() : 4.7;
    final int reviewCount = args?['reviewCount'] ?? 2156;
    final String emoji = args?['emoji'] ?? '❄️';

    serviceDetails = ServiceDetailsDataModel(
      title: title,
      priceText: priceText,
      rating: rating,
      reviewCount: reviewCount,
      durationText: '১-২ ঘণ্টা',
      iconEmoji: emoji,
      description: 'এসি ফিল্টার, কয়েল ও ড্রেন পরিষ্কার। দক্ষ টেকনিশিয়ান।',
      includedFeatures: [
        'প্রশিক্ষিত প্রফেশনাল',
        'নিজস্ব সরঞ্জাম',
        '১০০% সন্তুষ্টি গ্যারান্টি',
        'বীমা আওতাভুক্ত',
      ],
      reviews: [
        ServiceReviewModel(
          userName: 'রাহেলা বেগম',
          rating: 5.0,
          comment: 'অসাধারণ সেবা! পুরো বাড়ি ঝকঝকে হয়ে গেছে।',
          timeAgoText: '২ দিন আগে',
        ),
        ServiceReviewModel(
          userName: 'করিম সাহেব',
          rating: 4.0,
          comment: 'সময়মতো এসেছেন এবং কাজ ভালো করেন।',
          timeAgoText: '৫ দিন আগে',
        ),
      ],
    ).obs;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void onBookNowPressed() {
    // Handle Booking action
  }
}
