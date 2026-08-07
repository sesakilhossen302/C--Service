class ContactInfoModel {
  final String phone;
  final String operatingHours;
  final String liveChatTitle;
  final String responseTimeText;

  ContactInfoModel({
    required this.phone,
    required this.operatingHours,
    required this.liveChatTitle,
    required this.responseTimeText,
  });
}

class ContactMessageDataModel {
  final String subject;
  final String description;

  ContactMessageDataModel({
    required this.subject,
    required this.description,
  });
}
