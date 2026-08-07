import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Model/referral_model.dart';

class ReferralController extends GetxController {
  final referralData = ReferralDataModel(
    referralCode: 'SAKIB100',
    totalReferralsCount: 3,
    totalEarnedText: '৳৩০০',
    currentBalanceText: '৳২০০',
  ).obs;

  void onCopyCode() {
    Clipboard.setData(ClipboardData(text: referralData.value.referralCode));
    Get.snackbar('কপি হয়েছে!', 'রেফারেল কোড "${referralData.value.referralCode}" ক্লিপবোর্ডে কপি করা হয়েছে।');
  }

  void onShareCode() {
    Get.snackbar('শেয়ার করুন', 'আপনার রেফারেল কোড "${referralData.value.referralCode}" বন্ধুদের সাথে শেয়ার করুন!');
  }
}
