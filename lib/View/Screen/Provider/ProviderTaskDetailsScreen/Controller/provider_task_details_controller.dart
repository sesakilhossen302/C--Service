import 'package:get/get.dart';
import '../../ProviderTaskScreen/Model/provider_task_model.dart';

class ProviderTaskDetailsController extends GetxController {
  late ProviderTaskModel task;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null && args['task'] is ProviderTaskModel) {
      task = args['task'];
    } else {
      task = ProviderTaskModel(
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
      );
    }
  }

  void onCompleteTaskPressed() {
    Get.back();
  }

  void onCallCustomerPressed() {
    // Call customer action
  }

  void onViewReviewPressed() {
    // View review action
  }
}
