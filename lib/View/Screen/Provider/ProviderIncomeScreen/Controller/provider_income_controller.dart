import 'package:get/get.dart';
import '../Model/provider_income_model.dart';

class ProviderIncomeController extends GetxController {
  final totalBalance = '৳১২,৮৫০'.obs;
  final thisMonthIncome = '৳৮,৪০০'.obs;
  final lastMonthIncome = '৳৯,২০০'.obs;

  final transactions = <ProviderTransactionModel>[
    ProviderTransactionModel(
      id: '1',
      title: 'হোম ক্লিনিং',
      dateText: 'আজ',
      amountText: '+৳800',
    ),
    ProviderTransactionModel(
      id: '2',
      title: 'ডিপ ক্লিনিং',
      dateText: 'আজ',
      amountText: '+৳1500',
    ),
    ProviderTransactionModel(
      id: '3',
      title: 'বাথরুম পরিষ্কার',
      dateText: 'কাল',
      amountText: '+৳450',
    ),
    ProviderTransactionModel(
      id: '4',
      title: 'এসি ক্লিনিং',
      dateText: '৫ জুলাই',
      amountText: '+৳600',
    ),
  ].obs;

  void onWithdrawPressed() {
    // Handle withdraw money action
  }

  void onAnalyticsPressed() {
    // Handle analytics action
  }
}
