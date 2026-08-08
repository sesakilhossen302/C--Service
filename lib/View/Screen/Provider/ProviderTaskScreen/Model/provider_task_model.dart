class ProviderTaskModel {
  final String id;
  final String title;
  final String customerName;
  final String location;
  final String dateText;
  final String timeText;
  final String priceText;
  final String status;

  ProviderTaskModel({
    required this.id,
    required this.title,
    required this.customerName,
    required this.location,
    required this.dateText,
    required this.timeText,
    required this.priceText,
    required this.status,
  });
}
