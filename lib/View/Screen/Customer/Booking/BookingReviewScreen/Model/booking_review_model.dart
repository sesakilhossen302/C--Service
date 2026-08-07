class BookingServiceSummaryModel {
  final String serviceTitle;
  final String durationText;
  final String iconEmoji;

  BookingServiceSummaryModel({
    required this.serviceTitle,
    required this.durationText,
    required this.iconEmoji,
  });
}

class BookingAddressSummaryModel {
  final String title;
  final String fullAddress;

  BookingAddressSummaryModel({
    required this.title,
    required this.fullAddress,
  });
}

class BookingDateTimeSummaryModel {
  final String dateText;
  final String timeText;

  BookingDateTimeSummaryModel({
    required this.dateText,
    required this.timeText,
  });
}

class BookingPriceBreakdownModel {
  final int servicePrice;
  final int travelCharge;
  final int discount;

  BookingPriceBreakdownModel({
    required this.servicePrice,
    required this.travelCharge,
    this.discount = 0,
  });

  int get totalPrice => (servicePrice + travelCharge) - discount;
}

class BookingReviewDataModel {
  BookingServiceSummaryModel serviceSummary;
  BookingAddressSummaryModel addressSummary;
  BookingDateTimeSummaryModel dateTimeSummary;
  BookingPriceBreakdownModel priceBreakdown;

  BookingReviewDataModel({
    required this.serviceSummary,
    required this.addressSummary,
    required this.dateTimeSummary,
    required this.priceBreakdown,
  });
}
