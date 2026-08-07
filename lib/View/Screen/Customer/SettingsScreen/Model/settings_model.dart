class SettingsDataModel {
  final bool pushNotificationEnabled;
  final bool smsNotificationEnabled;
  final String selectedLanguageLabel;
  final String appVersion;

  SettingsDataModel({
    required this.pushNotificationEnabled,
    required this.smsNotificationEnabled,
    required this.selectedLanguageLabel,
    required this.appVersion,
  });
}
