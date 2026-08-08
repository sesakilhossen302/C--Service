import 'package:get/get.dart';
import '../Model/provider_task_model.dart';

class ProviderTaskController extends GetxController {
  final selectedTabIndex = 0.obs;

  final allTasks = <ProviderTaskModel>[
    ProviderTaskModel(
      id: '1',
      title: 'হোম ক্লিনিং',
      customerName: 'ফারহান সাহেব',
      location: 'ধানমন্ডি, ঢাকা',
      dateText: 'আজ',
      timeText: 'সকাল ১০:০০',
      priceText: '৳৮০০',
      status: 'চলমান',
    ),
    ProviderTaskModel(
      id: '2',
      title: 'ডিপ ক্লিনিং',
      customerName: 'সুমাইয়া বেগম',
      location: 'গুলশান, ঢাকা',
      dateText: 'আজ',
      timeText: 'বিকাল ২:০০',
      priceText: '৳১৫০০',
      status: 'চলমান',
    ),
    ProviderTaskModel(
      id: '3',
      title: 'এসি সার্ভিসিং',
      customerName: 'রাকিব আহমেদ',
      location: 'উত্তরা, ঢাকা',
      dateText: 'আগামীকাল',
      timeText: 'সকাল ১১:০০',
      priceText: '৳১২০০',
      status: 'আসন্ন',
    ),
    ProviderTaskModel(
      id: '4',
      title: 'বাথরুম পরিষ্কার',
      customerName: 'কামরুল হাসান',
      location: 'মিরপুর, ঢাকা',
      dateText: 'গতকাল',
      timeText: 'সকাল ৯:০০',
      priceText: '৳৬০০',
      status: 'সম্পন্ন',
    ),
  ].obs;

  List<ProviderTaskModel> get filteredTasks {
    if (selectedTabIndex.value == 0) {
      return allTasks.where((task) => task.status == 'চলমান').toList();
    } else if (selectedTabIndex.value == 1) {
      return allTasks.where((task) => task.status == 'আসন্ন').toList();
    } else {
      return allTasks.where((task) => task.status == 'সম্পন্ন').toList();
    }
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void onTaskTap(ProviderTaskModel task) {
    // Handle task details view action
  }
}
