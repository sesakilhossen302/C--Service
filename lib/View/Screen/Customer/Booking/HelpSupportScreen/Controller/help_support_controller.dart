import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
import '../Model/help_support_model.dart';

class HelpSupportController extends GetxController {
  final faqs = <FaqItemModel>[
    FaqItemModel(
      id: '1',
      question: 'কীভাবে বুকিং বাতিল করব?',
      answer: 'বুকিং ডিটেইলস পেজ থেকে সেবা শুরুর ২ ঘণ্টা পূর্বে বুকিং বাতিল করতে পারবেন।',
      isExpanded: false,
    ),
    FaqItemModel(
      id: '2',
      question: 'পেমেন্ট কীভাবে করব?',
      answer: 'বিকাশ, নগদ, ডেবিট/ক্রেডিট কার্ড বা ক্যাশ অন সার্ভিসের মাধ্যমে পেমেন্ট করতে পারবেন।',
      isExpanded: false,
    ),
    FaqItemModel(
      id: '3',
      question: 'প্রফেশনাল না আসলে কী করব?',
      answer: 'সাপোর্টে যোগাযোগ করুন বা চ্যাটে লিখুন। আমরা দ্রুত বিকল্প পাঠাব।',
      isExpanded: true,
    ),
    FaqItemModel(
      id: '4',
      question: 'সেবার মান ভালো না হলে?',
      answer: 'আমাদের ২৪ ঘণ্টার মধ্যে জানান। বিনামূল্যে রি-সার্ভিস প্রদান করা হবে।',
      isExpanded: false,
    ),
    FaqItemModel(
      id: '5',
      question: 'HomeCare Prime কি?',
      answer: 'HomeCare Prime হলো আমাদের প্রিমিয়াম মেম্বারশিপ সার্ভিস যাতে পান আকর্ষণীয় ডিসকাউন্ট।',
      isExpanded: false,
    ),
  ].obs;

  void toggleFaq(String id) {
    final index = faqs.indexWhere((item) => item.id == id);
    if (index != -1) {
      faqs[index] = faqs[index].copyWith(isExpanded: !faqs[index].isExpanded);
    }
  }

  void onLiveChat() {
    Get.toNamed(AppRoute.contactUsScreen);
  }

  void onCallSupport() {
    CustomSnackbar.showInfo(
      title: 'কল করা হচ্ছে',
      message: '09678-123456 নম্বরে কল করা হচ্ছে...',
    );
  }
}
