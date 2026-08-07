class SavedAddressModel {
  final String id;
  final String title;
  final String fullAddress;
  final bool isDefault;
  final String iconType; // 'home' or 'office'

  SavedAddressModel({
    required this.id,
    required this.title,
    required this.fullAddress,
    this.isDefault = false,
    this.iconType = 'home',
  });
}
