import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/customer_home_model.dart';

class CustomerHomeController extends GetxController {
  final searchController = TextEditingController();

  final List<ServiceItemModel> popularServices = [
    ServiceItemModel(title: 'হোম ক্লিনিং', iconEmoji: '🏠'),
    ServiceItemModel(title: 'ডিপ ক্লিনিং', iconEmoji: '✨'),
    ServiceItemModel(title: 'বাথরুম পরিষ্কার', iconEmoji: '🚿'),
    ServiceItemModel(title: 'রান্নাঘর পরিষ্কার', iconEmoji: '🍳'),
    ServiceItemModel(title: 'সোফা ক্লিনিং', iconEmoji: '🛋️'),
    ServiceItemModel(title: 'কার্পেট ক্লিনিং', iconEmoji: '🏮'),
    ServiceItemModel(title: 'পর্দা ক্লিনিং', iconEmoji: '🪟'),
    ServiceItemModel(title: 'মেট্রেস পরিষ্কার', iconEmoji: '🛏️'),
  ];

  final List<CategoryItemModel> categories = [
    CategoryItemModel(title: 'পরিষ্কার সেবা', countText: '৯টি সেবা', iconEmoji: '🧹'),
    CategoryItemModel(title: 'মেরামত সেবা', countText: '৪টি সেবা', iconEmoji: '🔧'),
    CategoryItemModel(title: 'যন্ত্রপাতি', countText: '২টি সেবা', iconEmoji: '❄️'),
    CategoryItemModel(title: 'গৃহকর্মী', countText: '২টি সেবা', iconEmoji: '👨‍🍳'),
  ];

  final UpcomingBookingModel upcomingBooking = UpcomingBookingModel(
    serviceTitle: 'হোম ক্লিনিং',
    dateText: '৩ জুলাই',
    timeText: 'সকাল ১০:০০',
    status: 'আসন্ন',
  );

  void onSearchChanged(String query) {
    // Handle search query
  }

  void onAiChatPressed() {
    // Handle AI Assistant chat action
  }

  void onTrackServicePressed() {
    // Handle track booking service
  }

  void onServiceDetailsPressed() {
    // Handle service details
  }

  void onJoinPrimePressed() {
    // Handle prime membership join
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
