import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/AppRoute/app_route.dart';
import '../../CustomerNavBarScreen/Controller/customer_nav_bar_controller.dart';
import '../Model/customer_profile_model.dart';

class CustomerProfileController extends GetxController {
  final userInfo = UserProfileInfoModel(
    name: 'সাকিব আহমেদ',
    phone: '+880 1712-345678',
    membershipTag: 'Prime সদস্য',
    avatarInitial: 'স',
  ).obs;

  void onEditProfile() {
    Get.snackbar('প্রোফাইল সম্পাদনা', 'প্রোফাইল তথ্য আপডেট ফিচার শীঘ্রই আসছে।');
  }

  void onMyBookings() {
    if (Get.isRegistered<CustomerNavBarController>()) {
      Get.find<CustomerNavBarController>().changeIndex(2);
    } else {
      Get.offAllNamed(AppRoute.customerNavBarScreen);
      Future.microtask(() {
        if (Get.isRegistered<CustomerNavBarController>()) {
          Get.find<CustomerNavBarController>().changeIndex(2);
        }
      });
    }
  }

  void onMyReviews() {
    Get.toNamed(AppRoute.myReviewsScreen);
  }

  void onHomeCarePrime() {
    Get.toNamed(AppRoute.homePassportScreen);
  }

  void onReferral() {
    Get.snackbar('রেফারেল', 'বন্ধুকে রেফার করুন এবং পান ২০০ টাকা ছাড়!');
  }

  void onSavedAddresses() {
    Get.toNamed(AppRoute.selectAddressScreen);
  }

  void onHelp() {
    if (Get.isRegistered<CustomerNavBarController>()) {
      Get.find<CustomerNavBarController>().changeIndex(3);
    } else {
      Get.offAllNamed(AppRoute.customerNavBarScreen);
      Future.microtask(() {
        if (Get.isRegistered<CustomerNavBarController>()) {
          Get.find<CustomerNavBarController>().changeIndex(3);
        }
      });
    }
  }

  void onContactUs() {
    Get.toNamed(AppRoute.contactUsScreen);
  }

  void onChangeLanguage() {
    Get.snackbar('ভাষা পরিবর্তন', 'বর্তমান ভাষা: বাংলা');
  }

  void onPrivacyPolicy() {
    Get.snackbar('গোপনীয়তা নীতি', 'আমাদের গোপনীয়তা নীতি পেজ শীঘ্রই হালনাগাদ হবে।');
  }

  void onTermsAndConditions() {
    Get.snackbar('শর্তাবলী', 'ব্যবহারের সকল নিয়ামবলী পড়ুন।');
  }

  void onSettings() {
    Get.snackbar('সেটিংস', 'অ্যাপ সেটিংস পরিবর্তন করুন।');
  }

  void onLogout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('লগআউট কনফার্মেশন', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('আপনি কি নিশ্চিত যে অ্যাকাউন্ট থেকে লগআউট করতে চান?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('বাতিল', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(AppRoute.loginScreen);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEF4444)),
            child: const Text('লগআউট', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
