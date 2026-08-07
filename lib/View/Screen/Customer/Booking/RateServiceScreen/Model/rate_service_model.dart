class FeedbackTagModel {
  final String id;
  final String label;
  final bool isSelected;

  FeedbackTagModel({
    required this.id,
    required this.label,
    this.isSelected = false,
  });

  FeedbackTagModel copyWith({bool? isSelected}) {
    return FeedbackTagModel(
      id: id,
      label: label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class RateServiceDataModel {
  final String technicianName;
  final String serviceTitle;
  final String avatarEmoji;
  final int selectedRating;
  final List<FeedbackTagModel> tags;
  final String comment;

  RateServiceDataModel({
    required this.technicianName,
    required this.serviceTitle,
    this.avatarEmoji = '👨‍🔧',
    this.selectedRating = 0,
    required this.tags,
    this.comment = '',
  });
}
