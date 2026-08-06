class CustomerReviewItemModel {
  final String id;
  final String serviceTitle;
  final double rating;
  final String comment;
  final String providerName;
  final String dateText;

  CustomerReviewItemModel({
    required this.id,
    required this.serviceTitle,
    required this.rating,
    required this.comment,
    required this.providerName,
    required this.dateText,
  });
}

class RatingBreakdownModel {
  final int starCount;
  final double ratio;

  RatingBreakdownModel({
    required this.starCount,
    required this.ratio,
  });
}
