import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
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
    CustomSnackbar.showSuccess(
      title: 'কপি হয়েছে!',
      message: 'রেফারেল কোড "${referralData.value.referralCode}" ক্লিপবোর্ডে কপি করা হয়েছে।',
    );
  }

  void onShareCode() {
    CustomSnackbar.showInfo(
      title: 'শেয়ার করুন',
      message: 'আপনার রেফারেল কোড "${referralData.value.referralCode}" বন্ধুদের সাথে শেয়ার করুন!',
    );
  }
}
