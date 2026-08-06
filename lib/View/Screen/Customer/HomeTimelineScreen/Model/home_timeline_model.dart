class TimelineHistoryItemModel {
  final String title;
  final String dateText;
  final String statusText;
  final bool isUpcoming;
  final String iconEmoji;

  TimelineHistoryItemModel({
    required this.title,
    required this.dateText,
    required this.statusText,
    required this.isUpcoming,
    required this.iconEmoji,
  });
}

class TimelineGroupModel {
  final String monthTitle;
  final List<TimelineHistoryItemModel> items;

  TimelineGroupModel({
    required this.monthTitle,
    required this.items,
  });
}

class UpcomingMaintenanceItemModel {
  final String title;
  final String dueTimeText;
  final String iconEmoji;

  UpcomingMaintenanceItemModel({
    required this.title,
    required this.dueTimeText,
    required this.iconEmoji,
  });
}
