class PaymentMethodModel {
  final String id;
  final String title;
  final String iconEmoji;
  final String imageAssetPath;
  final String logoType; // 'bkash', 'nagad', 'card', 'debit', 'cash'
  final bool isAvailable;

  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.iconEmoji,
    required this.imageAssetPath,
    required this.logoType,
    this.isAvailable = true,
  });
}

class PaymentDataModel {
  final int totalAmount;
  final List<PaymentMethodModel> paymentMethods;
  final String selectedMethodId;
  final String accountNumberHint;

  PaymentDataModel({
    required this.totalAmount,
    required this.paymentMethods,
    required this.selectedMethodId,
    this.accountNumberHint = '01700-000000',
  });
}
