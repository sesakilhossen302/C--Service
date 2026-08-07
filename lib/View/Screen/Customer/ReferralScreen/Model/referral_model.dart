class ReferralDataModel {
  final String referralCode;
  final int totalReferralsCount;
  final String totalEarnedText;
  final String currentBalanceText;

  ReferralDataModel({
    required this.referralCode,
    required this.totalReferralsCount,
    required this.totalEarnedText,
    required this.currentBalanceText,
  });
}
