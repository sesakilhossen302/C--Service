import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/notification_model.dart';

class NotificationController extends GetxController {
  final notifications = <NotificationItemModel>[
    NotificationItemModel(
      id: '1',
      title: 'বুকিং নিশ্চিত',
      body: 'আপনার হোম ক্লিনিং বুকিং #BK-1234 নিশ্চিত হয়েছে।',
      timeText: '১০ মি. আগে',
      icon: Icons.inventory_2_outlined,
      iconColor: const Color(0xFF0E7A57),
      iconBgColor: const Color(0xFFE8F5E9),
      isRead: false,
    ),
    NotificationItemModel(
      id: '2',
      title: 'প্রফেশনাল আসছেন',
      body: 'রহিম মিয়া আপনার কাছে আসছেন। আনুমানিক ১৫ মিনিট।',
      timeText: '২ ঘণ্টা আগে',
      icon: Icons.location_on_outlined,
      iconColor: const Color(0xFF3B82F6),
      iconBgColor: const Color(0xFFEFF6FF),
      isRead: false,
    ),
    NotificationItemModel(
      id: '3',
      title: 'সেবা সম্পন্ন',
      body: 'আপনার এসি ক্লিনিং সম্পন্ন হয়েছে। রেটিং দিন।',
      timeText: 'গতকাল',
      icon: Icons.check_circle_outline_rounded,
      iconColor: const Color(0xFF0E7A57),
      iconBgColor: const Color(0xFFE8F5E9),
      isRead: true,
    ),
    NotificationItemModel(
      id: '4',
      title: 'বিশেষ অফার!',
      body: 'ডিপ ক্লিনিং-এ ২০% ছাড়! আজই বুক করুন।',
      timeText: '২ দিন আগে',
      icon: Icons.card_giftcard_rounded,
      iconColor: const Color(0xFFF97316),
      iconBgColor: const Color(0xFFFFF7ED),
      isRead: true,
    ),
    NotificationItemModel(
      id: '5',
      title: 'HomeCare Prime',
      body: 'Prime সদস্যপদে যোগ দিন এবং সব সেবায় ১৫% ছাড় পান।',
      timeText: '৩ দিন আগে',
      icon: Icons.card_giftcard_rounded,
      iconColor: const Color(0xFFF97316),
      iconBgColor: const Color(0xFFFFF7ED),
      isRead: true,
    ),
  ].obs;

  void markAllAsRead() {
    for (var item in notifications) {
      item.isRead = true;
    }
    notifications.refresh();
  }

  void markAsRead(int index) {
    notifications[index].isRead = true;
    notifications.refresh();
  }
}
