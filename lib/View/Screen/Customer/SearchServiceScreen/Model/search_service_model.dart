class SearchServiceModel {
  final String id;
  final String title;
  final String category;
  final double rating;
  final int reviewCount;
  final String priceText;
  final String iconEmoji;

  SearchServiceModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.priceText,
    required this.iconEmoji,
  });
}
