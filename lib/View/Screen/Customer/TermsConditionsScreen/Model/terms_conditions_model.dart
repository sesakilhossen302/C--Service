class TermsItemModel {
  final String title;
  final String description;

  TermsItemModel({
    required this.title,
    required this.description,
  });
}

class TermsConditionsDataModel {
  final String lastUpdatedText;
  final List<TermsItemModel> items;

  TermsConditionsDataModel({
    required this.lastUpdatedText,
    required this.items,
  });
}
