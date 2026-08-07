enum TrackingStepStatus { completed, active, pending }

class TrackingStepModel {
  final String id;
  final String title;
  final String timeText;
  final TrackingStepStatus status;

  TrackingStepModel({
    required this.id,
    required this.title,
    required this.timeText,
    required this.status,
  });
}

class TechnicianModel {
  final String name;
  final double rating;
  final int totalServicesCount;
  final String phone;
  final String avatarEmoji;

  TechnicianModel({
    required this.name,
    required this.rating,
    required this.totalServicesCount,
    required this.phone,
    this.avatarEmoji = '👨‍🔧',
  });
}

class BookingTrackingDataModel {
  final String serviceTitle;
  final String dateTimeText;
  final String statusTag;
  final TechnicianModel technician;
  final List<TrackingStepModel> steps;

  BookingTrackingDataModel({
    required this.serviceTitle,
    required this.dateTimeText,
    required this.statusTag,
    required this.technician,
    required this.steps,
  });
}
