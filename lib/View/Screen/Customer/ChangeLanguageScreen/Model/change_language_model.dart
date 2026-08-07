class LanguageOptionModel {
  final String code;
  final String nativeTitle;
  final String secondaryTitle;
  final bool isSelected;

  LanguageOptionModel({
    required this.code,
    required this.nativeTitle,
    required this.secondaryTitle,
    this.isSelected = false,
  });

  LanguageOptionModel copyWith({bool? isSelected}) {
    return LanguageOptionModel(
      code: code,
      nativeTitle: nativeTitle,
      secondaryTitle: secondaryTitle,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
