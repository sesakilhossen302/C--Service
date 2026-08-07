import 'package:get/get.dart';
import '../Model/privacy_policy_model.dart';

class PrivacyPolicyController extends GetxController {
  final policyData = PrivacyPolicyDataModel(
    lastUpdatedText: 'সর্বশেষ আপডেট: জুলাই ২০২৫',
    items: [
      PolicyItemModel(
        title: 'তথ্য সংগ্রহ',
        description: 'আমরা শুধুমাত্র সেবা প্রদানের জন্য প্রয়োজনীয় তথ্য সংগ্রহ করি। আপনার ব্যক্তিগত তথ্য তৃতীয় পক্ষের সাথে শেয়ার করা হয় না।',
      ),
      PolicyItemModel(
        title: 'তথ্য ব্যবহার',
        description: 'আপনার তথ্য বুকিং প্রক্রিয়াকরণ, সেবা উন্নয়ন এবং যোগাযোগের জন্য ব্যবহৃত হয়।',
      ),
      PolicyItemModel(
        title: 'তথ্য সুরক্ষা',
        description: 'SSL এনক্রিপশন এবং আধুনিক নিরাপত্তা ব্যবস্থা দিয়ে আপনার তথ্য সুরক্ষিত।',
      ),
      PolicyItemModel(
        title: 'আপনার অধিকার',
        description: 'আপনি যেকোনো সময় আপনার তথ্য দেখতে, পরিবর্তন করতে বা মুছে ফেলতে পারেন।',
      ),
    ],
  ).obs;
}
