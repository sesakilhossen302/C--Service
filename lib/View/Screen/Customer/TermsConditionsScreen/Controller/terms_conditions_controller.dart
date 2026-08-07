import 'package:get/get.dart';
import '../Model/terms_conditions_model.dart';

class TermsConditionsController extends GetxController {
  final termsData = TermsConditionsDataModel(
    lastUpdatedText: 'সর্বশেষ আপডেট: জুলাই ২০২৫',
    items: [
      TermsItemModel(
        title: 'সেবা ব্যবহারের শর্ত',
        description: 'HomeCare OS ব্যবহার করে আপনি এই শর্তাবলী মেনে নিচ্ছেন। সেবা শুধুমাত্র বৈধ উদ্দেশ্যে ব্যবহার করা যাবে।',
      ),
      TermsItemModel(
        title: 'বুকিং নীতি',
        description: 'বুকিং নিশ্চিত হলে একটি নিশ্চিতকরণ বার্তা পাঠানো হবে। সেবার ২৪ ঘণ্টা আগে বাতিল করা যাবে।',
      ),
      TermsItemModel(
        title: 'পেমেন্ট নীতি',
        description: 'সমস্ত পেমেন্ট নিরাপদ। রিফান্ড ৩-৭ কার্যদিবসের মধ্যে প্রক্রিয়া করা হবে।',
      ),
      TermsItemModel(
        title: 'দায়বদ্ধতা',
        description: 'আমরা সেরা সেবা নিশ্চিত করতে প্রতিশ্রুতিবদ্ধ। যেকোনো সমস্যায় আমাদের সাথে যোগাযোগ করুন।',
      ),
    ],
  ).obs;
}
