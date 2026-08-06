import 'package:get/get.dart';
import '../Model/provider_home_model.dart';

class ProviderHomeController extends GetxController {
  final isOnline = true.obs;

  final String todayIncome = '৳২,৩০০';
  final String completedWorkCount = '২৪';
  final String ratingVal = '4.8★';

  final List<ProviderTodayTaskModel> todayTasks = [
    ProviderTodayTaskModel(
      title: 'হোম ক্লিনিং',
      customerName: 'ফারহান সাহেব',
      location: 'ধানমন্ডি, ঢাকা',
      timeText: 'সকাল ১০:০০',
      priceText: '৳৪০০',
      statusText: 'চলছে',
    ),
    ProviderTodayTaskModel(
      title: 'ডিপ ক্লিনিং',
      customerName: 'সুমাইয়া বেগম',
      location: 'গুলশান, ঢাকা',
      timeText: 'বিকাল ২:০০',
      priceText: '৳১৫০০',
      statusText: 'চলছে',
    ),
  ];

  final List<QuickActionModel> quickActions = [
    QuickActionModel(title: 'কাজের তালিকা', iconEmoji: '📋'),
    QuickActionModel(title: 'আয় দেখুন', iconEmoji: '💰'),
    QuickActionModel(title: 'রিভিউ দেখুন', iconEmoji: '⭐'),
    QuickActionModel(title: 'সাহায্য', iconEmoji: '🛟'),
  ];

  final List<PerformanceMetricModel> performanceMetrics = [
    PerformanceMetricModel(
      title: 'সম্পন্ন কাজ',
      valText: '18',
      progressRatio: 0.72,
    ),
    PerformanceMetricModel(
      title: 'গ্রাহক সন্তুষ্টি',
      valText: '96%',
      progressRatio: 0.96,
    ),
    PerformanceMetricModel(
      title: 'সময়মতো উপস্থিতি',
      valText: '98%',
      progressRatio: 0.98,
    ),
  ];

  void toggleOnlineStatus() {
    isOnline.value = !isOnline.value;
  }
}
