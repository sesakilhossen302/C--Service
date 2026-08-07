import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../Model/payment_model.dart';

class PaymentController extends GetxController {
  final selectedMethodId = 'bkash'.obs;
  final accountNumberController = TextEditingController();

  final paymentData = PaymentDataModel(
    totalAmount: 600,
    selectedMethodId: 'bkash',
    paymentMethods: [
      PaymentMethodModel(
        id: 'bkash',
        title: 'bKash',
        iconEmoji: '📱',
        imageAssetPath: 'assets/images/bkash-logo.png',
        logoType: 'bkash',
      ),
      PaymentMethodModel(
        id: 'nagad',
        title: 'Nagad',
        iconEmoji: '🔶',
        imageAssetPath: 'assets/images/Nagad-Logo.png',
        logoType: 'nagad',
      ),
      PaymentMethodModel(
        id: 'card',
        title: 'Visa / Mastercard',
        iconEmoji: '💳',
        imageAssetPath: 'assets/images/Visa-Mastercard- logo.png',
        logoType: 'card',
      ),
      PaymentMethodModel(
        id: 'debit',
        title: 'ডেবিট কার্ড',
        iconEmoji: '🏦',
        imageAssetPath: 'assets/images/ডেবিট কার্ড.png',
        logoType: 'debit',
      ),
      PaymentMethodModel(
        id: 'cash',
        title: 'ক্যাশ অন সার্ভিস',
        iconEmoji: '💵',
        imageAssetPath: 'assets/images/cash-on-delivery.jpg',
        logoType: 'cash',
      ),
    ],
  ).obs;

  void selectMethod(String id) {
    selectedMethodId.value = id;
  }

  void onConfirmPayment() {
    Get.toNamed(AppRoute.bookingSuccessScreen);
  }

  @override
  void onClose() {
    accountNumberController.dispose();
    super.onClose();
  }
}
