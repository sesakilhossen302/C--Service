import 'package:get/get.dart';
import '../Model/my_reviews_model.dart';

class MyReviewsController extends GetxController {
  final averageRating = 4.8.obs;
  final totalReviewsCount = 8.obs;

  final ratingBreakdown = <RatingBreakdownModel>[
    RatingBreakdownModel(starCount: 5, ratio: 0.82),
    RatingBreakdownModel(starCount: 4, ratio: 0.15),
    RatingBreakdownModel(starCount: 3, ratio: 0.08),
  ].obs;

  final userReviews = <CustomerReviewItemModel>[
    CustomerReviewItemModel(
      id: '1',
      serviceTitle: 'হোম ক্লিনিং',
      rating: 5.0,
      comment: 'অসাধারণ সেবা! পুরো বাড়ি ঝকঝকে।',
      providerName: 'রহিম মিয়া',
      dateText: '২৮ জুন',
    ),
    CustomerReviewItemModel(
      id: '2',
      serviceTitle: 'ইলেকট্রিশিয়ান',
      rating: 4.0,
      comment: 'সময়মতো এসেছেন এবং সমস্যা ঠিক করেছেন।',
      providerName: 'সালাম মিয়া',
      dateText: '২০ জুন',
    ),
  ].obs;
}
