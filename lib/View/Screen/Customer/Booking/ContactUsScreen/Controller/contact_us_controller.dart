import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/contact_us_model.dart';

class ContactUsController extends GetxController {
  final subjectController = TextEditingController(text: 'বুকিং সংক্রান্ত');
  final descriptionController = TextEditingController();

  final contactInfo = ContactInfoModel(
    phone: '09678-123456',
    operatingHours: 'সকাল ৮টা — রাত ১০টা',
    liveChatTitle: 'লাইভ চ্যাট',
    responseTimeText: 'গড় সাড়া সময় ২ মিনিট',
  ).obs;

  void onSendMessage() {
    final text = descriptionController.text.trim();
    if (text.isEmpty) {
      Get.snackbar('সতর্কতা', 'অনুগ্রহ করে আপনার সমস্যার বিবরণ লিখুন।');
      return;
    }
    Get.snackbar('বার্তা পাঠানো হয়েছে', 'আপনার বার্তা সফলভাবে পাঠানো হয়েছে। আমরা শীঘ্রই যোগাযোগ করব।');
    Get.back();
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
