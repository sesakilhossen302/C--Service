enum BookingStatus { upcoming, completed, cancelled }

class CustomerBookingItemModel {
  final String id;
  final String serviceTitle;
  final String dateText;
  final String timeText;
  final String addressText;
  final String priceText;
  final BookingStatus status;

  CustomerBookingItemModel({
    required this.id,
    required this.serviceTitle,
    required this.dateText,
    required this.timeText,
    required this.addressText,
    required this.priceText,
    required this.status,
  });

  String get statusLabel {
    switch (status) {
      case BookingStatus.upcoming:
        return 'আসন্ন';
      case BookingStatus.completed:
        return 'সম্পন্ন';
      case BookingStatus.cancelled:
        return 'বাতিল';
    }
  }
}
