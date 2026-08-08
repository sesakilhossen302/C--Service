import 'package:get/get.dart';
import '../../../../../Core/AppRoute/app_route.dart';
import '../Model/provider_task_model.dart';

class ProviderTaskController extends GetxController {
  final selectedTabIndex = 0.obs;

  final allTasks = <ProviderTaskModel>[
    ProviderTaskModel(
      id: '1',
      jobId: 'JOB-440',
      title: 'ডিপ ক্লিনিং',
      customerName: 'সুমাইয়া বেগম',
      location: 'গুলশান, ঢাকা',
      dateText: 'আজ',
      timeText: 'বিকাল ২:০০',
      priceText: '৳১৫০০',
      paymentMethod: 'নগদ',
      status: 'চলমান',
    ),
    ProviderTaskModel(
      id: '2',
      jobId: 'JOB-440',
      title: 'ডিপ ক্লিনিং',
      customerName: 'সুমাইয়া বেগম',
      location: 'গুলশান, ঢাকা',
      dateText: 'আজ',
      timeText: 'বিকাল ২:০০',
      priceText: '৳১৫০০',
      paymentMethod: 'নগদ',
      status: 'আসন্ন',
    ),
    ProviderTaskModel(
      id: '3',
      jobId: 'JOB-432',
      title: 'ইলেকট্রিশিয়ান',
      customerName: 'তানভীর সাহেব',
      location: 'মোহাম্মদপুর, ঢাকা',
      dateText: '২৮ জুন',
      timeText: 'বিকাল ৩:০০',
      priceText: '৳৪০০',
      paymentMethod: 'নগদ',
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
    Get.toNamed(AppRoute.providerTaskDetailsScreen, arguments: {'task': task});
  }
}
