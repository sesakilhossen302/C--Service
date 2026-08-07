import 'package:get/get.dart';
import '../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
import '../Model/homecare_prime_model.dart';

class HomeCarePrimeController extends GetxController {
  final benefits = <String>[
    'সব সেবায় ৫% ছাড়',
    'অগ্রাধিকার বুকিং',
    'বিনামূল্যে পরামর্শ',
    'বিশেষ Prime অফার',
    'মাসিক হোম রিপোর্ট',
  ];

  final plans = <PrimePlanModel>[
    PrimePlanModel(
      id: 'monthly',
      title: 'মাসিক প্ল্যান',
      monthlyPriceText: '৳৪৯৯/মাস',
      totalPriceText: '৳৪৯৯',
      isSelected: false,
    ),
    PrimePlanModel(
      id: 'annual',
      title: 'বার্ষিক প্ল্যান',
      monthlyPriceText: '৳৪০০/মাস',
      totalPriceText: '৳৪,৭৯৯',
      discountBadge: '৫০% সাশ্রয়',
      isSelected: true,
    ),
  ].obs;

  void selectPlan(String id) {
    for (int i = 0; i < plans.length; i++) {
      plans[i] = plans[i].copyWith(isSelected: plans[i].id == id);
    }
  }

  void onJoinPrime() {
    final selected = plans.firstWhere((p) => p.isSelected, orElse: () => plans.last);
    CustomSnackbar.showSuccess(
      title: 'ধন্যবাদ!',
      message: '${selected.title} সফলভাবে সাবস্ক্রাইব করা হয়েছে।',
    );
    Get.back();
  }
}
