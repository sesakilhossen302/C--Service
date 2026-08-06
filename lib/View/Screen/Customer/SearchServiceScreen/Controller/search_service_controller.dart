import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/search_service_model.dart';

class SearchServiceController extends GetxController {
  final searchController = TextEditingController();

  final selectedCategory = 'সব'.obs;
  final categories = ['সব', 'পরিষ্কার', 'মেরামত', 'যন্ত্রপাতি', 'গৃহকর্মী'];

  final allServices = <SearchServiceModel>[
    SearchServiceModel(id: '1', title: 'হোম ক্লিনিং', category: 'পরিষ্কার', rating: 4.8, reviewCount: 1243, priceText: '৳৮০০', iconEmoji: '🏠'),
    SearchServiceModel(id: '2', title: 'ডিপ ক্লিনিং', category: 'পরিষ্কার', rating: 4.9, reviewCount: 876, priceText: '৳১,৫০০', iconEmoji: '✨'),
    SearchServiceModel(id: '3', title: 'বাথরুম পরিষ্কার', category: 'পরিষ্কার', rating: 4.8, reviewCount: 1654, priceText: '৳৪৫০', iconEmoji: '🚿'),
    SearchServiceModel(id: '4', title: 'রান্নাঘর পরিষ্কার', category: 'পরিষ্কার', rating: 4.7, reviewCount: 987, priceText: '৳৬০০', iconEmoji: '🍳'),
    SearchServiceModel(id: '5', title: 'সোফা ক্লিনিং', category: 'পরিষ্কার', rating: 4.6, reviewCount: 765, priceText: '৳৮০০', iconEmoji: '🛋️'),
    SearchServiceModel(id: '6', title: 'কার্পেট ক্লিনিং', category: 'পরিষ্কার', rating: 4.5, reviewCount: 342, priceText: '৳১,০০০', iconEmoji: '🏮'),
    SearchServiceModel(id: '7', title: 'পর্দা ক্লিনিং', category: 'পরিষ্কার', rating: 4.5, reviewCount: 231, priceText: '৳৭০০', iconEmoji: '🪟'),
    SearchServiceModel(id: '8', title: 'গদি পরিষ্কার', category: 'পরিষ্কার', rating: 4.6, reviewCount: 412, priceText: '৳৯০০', iconEmoji: '🛏️'),
    SearchServiceModel(id: '9', title: 'ওয়াটার ট্যাংক', category: 'পরিষ্কার', rating: 4.7, reviewCount: 543, priceText: '৳১,১০০', iconEmoji: '💧'),
    SearchServiceModel(id: '10', title: 'এসি ক্লিনিং', category: 'যন্ত্রপাতি', rating: 4.7, reviewCount: 2156, priceText: '৳৬০০', iconEmoji: '❄️'),
    SearchServiceModel(id: '11', title: 'এসি মেরামত', category: 'মেরামত', rating: 4.6, reviewCount: 1123, priceText: '৳৮০০', iconEmoji: '⚙️'),
    SearchServiceModel(id: '12', title: 'ইলেকট্রিশিয়ান', category: 'মেরামত', rating: 4.6, reviewCount: 3421, priceText: '৳৪০০', iconEmoji: '⚡'),
    SearchServiceModel(id: '13', title: 'প্লাম্বার', category: 'মেরামত', rating: 4.5, reviewCount: 1987, priceText: '৳৫০০', iconEmoji: '🔧'),
    SearchServiceModel(id: '14', title: 'রঙ করা', category: 'মেরামত', rating: 4.7, reviewCount: 432, priceText: '৳২,৫০০', iconEmoji: '🎨'),
    SearchServiceModel(id: '15', title: 'হ্যান্ডিম্যান', category: 'মেরামত', rating: 4.5, reviewCount: 876, priceText: '৳৩৫০', iconEmoji: '🛠️'),
    SearchServiceModel(id: '16', title: 'পেস্ট কন্ট্রোল', category: 'পরিষ্কার', rating: 4.8, reviewCount: 543, priceText: '৳১,২০০', iconEmoji: '🛡️'),
    SearchServiceModel(id: '17', title: 'রান্নার লোক', category: 'গৃহকর্মী', rating: 4.7, reviewCount: 234, priceText: '৳১,৫০০', iconEmoji: '👨‍🍳'),
    SearchServiceModel(id: '18', title: 'গৃহকর্মী', category: 'গৃহকর্মী', rating: 4.6, reviewCount: 456, priceText: '৳১,৮০০', iconEmoji: '🧹'),
    SearchServiceModel(id: '19', title: 'অফিস ক্লিনিং', category: 'পরিষ্কার', rating: 4.7, reviewCount: 321, priceText: '৳২,০০০', iconEmoji: '🏢'),
  ];

  final filteredServices = <SearchServiceModel>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredServices.assignAll(allServices);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    searchQuery.value = searchController.text;
    filterData();
  }

  void selectCategory(String cat) {
    selectedCategory.value = cat;
    filterData();
  }

  void filterData() {
    final query = searchQuery.value.trim().toLowerCase();
    final category = selectedCategory.value;

    filteredServices.assignAll(
      allServices.where((item) {
        final matchesQuery = query.isEmpty || item.title.toLowerCase().contains(query);
        final matchesCategory = category == 'সব' || item.category == category;
        return matchesQuery && matchesCategory;
      }).toList(),
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
