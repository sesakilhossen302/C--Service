import 'package:flutter/material.dart';

class NotificationItemModel {
  final String id;
  final String title;
  final String body;
  final String timeText;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  bool isRead;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timeText,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.isRead = false,
  });
}
