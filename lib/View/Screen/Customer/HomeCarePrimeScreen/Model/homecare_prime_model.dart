class PrimePlanModel {
  final String id;
  final String title;
  final String monthlyPriceText;
  final String totalPriceText;
  final String? discountBadge;
  final bool isSelected;

  PrimePlanModel({
    required this.id,
    required this.title,
    required this.monthlyPriceText,
    required this.totalPriceText,
    this.discountBadge,
    this.isSelected = false,
  });

  PrimePlanModel copyWith({bool? isSelected}) {
    return PrimePlanModel(
      id: id,
      title: title,
      monthlyPriceText: monthlyPriceText,
      totalPriceText: totalPriceText,
      discountBadge: discountBadge,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
