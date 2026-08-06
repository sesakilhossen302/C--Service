class ServiceItemModel {
  final String title;
  final String iconEmoji;

  ServiceItemModel({
    required this.title,
    required this.iconEmoji,
  });
}

class CategoryItemModel {
  final String title;
  final String countText;
  final String iconEmoji;

  CategoryItemModel({
    required this.title,
    required this.countText,
    required this.iconEmoji,
  });
}

class UpcomingBookingModel {
  final String serviceTitle;
  final String dateText;
  final String timeText;
  final String status;

  UpcomingBookingModel({
    required this.serviceTitle,
    required this.dateText,
    required this.timeText,
    required this.status,
  });
}
