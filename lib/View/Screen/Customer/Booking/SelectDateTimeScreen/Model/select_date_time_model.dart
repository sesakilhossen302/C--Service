class BookingDateModel {
  final String id;
  final String dayOfWeek;
  final String dateText;
  final String fullLabel;
  final bool isAvailable;

  BookingDateModel({
    required this.id,
    required this.dayOfWeek,
    required this.dateText,
    required this.fullLabel,
    this.isAvailable = true,
  });
}

class BookingTimeSlotModel {
  final String id;
  final String period;
  final String timeText;
  final String fullLabel;
  final bool isAvailable;

  BookingTimeSlotModel({
    required this.id,
    required this.period,
    required this.timeText,
    required this.fullLabel,
    this.isAvailable = true,
  });
}
