import 'package:flutter/material.dart';

class ProfileMenuItemModel {
  final String id;
  final String title;
  final IconData icon;
  final bool isDestructive;
  final VoidCallback? onTap;

  ProfileMenuItemModel({
    required this.id,
    required this.title,
    required this.icon,
    this.isDestructive = false,
    this.onTap,
  });
}

class UserProfileInfoModel {
  final String name;
  final String phone;
  final String membershipTag;
  final String avatarInitial;

  UserProfileInfoModel({
    required this.name,
    required this.phone,
    required this.membershipTag,
    required this.avatarInitial,
  });
}
