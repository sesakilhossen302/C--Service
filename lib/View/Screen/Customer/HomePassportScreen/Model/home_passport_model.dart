class HomePassportInfoModel {
  String houseTitle;
  String healthScore;
  String totalServices;
  String thisMonthServices;
  String totalSavings;
  String address;
  String propertyType;
  String propertySize;
  String rooms;
  String registrationDate;

  HomePassportInfoModel({
    required this.houseTitle,
    required this.healthScore,
    required this.totalServices,
    required this.thisMonthServices,
    required this.totalSavings,
    required this.address,
    required this.propertyType,
    required this.propertySize,
    required this.rooms,
    required this.registrationDate,
  });
}

class SmartRecommendationModel {
  final String title;
  final String priceText;
  final String iconEmoji;

  SmartRecommendationModel({
    required this.title,
    required this.priceText,
    required this.iconEmoji,
  });
}
