class ServiceReviewModel {
  final String userName;
  final double rating;
  final String comment;
  final String timeAgoText;

  ServiceReviewModel({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.timeAgoText,
  });
}

class ServiceDetailsDataModel {
  final String title;
  final String priceText;
  final double rating;
  final int reviewCount;
  final String durationText;
  final String iconEmoji;
  final String description;
  final List<String> includedFeatures;
  final List<ServiceReviewModel> reviews;

  ServiceDetailsDataModel({
    required this.title,
    required this.priceText,
    required this.rating,
    required this.reviewCount,
    required this.durationText,
    required this.iconEmoji,
    required this.description,
    required this.includedFeatures,
    required this.reviews,
  });
}
