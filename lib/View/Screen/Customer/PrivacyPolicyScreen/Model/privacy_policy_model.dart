class PolicyItemModel {
  final String title;
  final String description;

  PolicyItemModel({
    required this.title,
    required this.description,
  });
}

class PrivacyPolicyDataModel {
  final String lastUpdatedText;
  final List<PolicyItemModel> items;

  PrivacyPolicyDataModel({
    required this.lastUpdatedText,
    required this.items,
  });
}
