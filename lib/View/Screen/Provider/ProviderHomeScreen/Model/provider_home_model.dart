class ProviderTodayTaskModel {
  final String title;
  final String customerName;
  final String location;
  final String timeText;
  final String priceText;
  final String statusText;

  ProviderTodayTaskModel({
    required this.title,
    required this.customerName,
    required this.location,
    required this.timeText,
    required this.priceText,
    required this.statusText,
  });
}

class QuickActionModel {
  final String title;
  final String iconEmoji;

  QuickActionModel({
    required this.title,
    required this.iconEmoji,
  });
}

class PerformanceMetricModel {
  final String title;
  final String valText;
  final double progressRatio;

  PerformanceMetricModel({
    required this.title,
    required this.valText,
    required this.progressRatio,
  });
}
