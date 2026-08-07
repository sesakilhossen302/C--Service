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
    Get.toNamed(AppRoute.editProfileScreen);
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
    Get.toNamed(AppRoute.homeCarePrimeScreen);
  }

  void onReferral() {
    Get.toNamed(AppRoute.referralScreen);
  }

  void onSavedAddresses() {
    Get.toNamed(AppRoute.selectAddressScreen, arguments: {'isManageOnly': true});
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
    Get.toNamed(AppRoute.changeLanguageScreen);
  }

  void onPrivacyPolicy() {
    Get.toNamed(AppRoute.privacyPolicyScreen);
  }

  void onTermsAndConditions() {
    Get.toNamed(AppRoute.termsConditionsScreen);
  }

  void onSettings() {
    Get.toNamed(AppRoute.settingsScreen);
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
