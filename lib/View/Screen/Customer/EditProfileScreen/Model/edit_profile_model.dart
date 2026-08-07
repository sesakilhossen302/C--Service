class EditProfileDataModel {
  final String fullName;
  final String mobileNumber;
  final String email;
  final String address;
  final String avatarInitial;

  EditProfileDataModel({
    required this.fullName,
    required this.mobileNumber,
    required this.email,
    required this.address,
    this.avatarInitial = 'স',
  });
}
