import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../Model/ai_assistant_model.dart';

class AiAssistantController extends GetxController {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final messages = <ChatMessageModel>[
    ChatMessageModel(
      text: 'আমি আপনার AI হোম কেয়ার সহকারী! বাড়ির যেকোনো সমস্যায় আমি সাহায্য করতে পারি। কী জানতে চান?',
      isUser: false,
    ),
    ChatMessageModel(
      text: 'এসি পরিষ্কার',
      isUser: true,
    ),
    ChatMessageModel(
      text: 'হোম ক্লিনিং বা ডিপ ক্লিনিং সেবা বুক করতে পারেন! আমাদের পেশাদার টিম আপনার বাড়ি ঝকঝকে করে দেবে।',
      isUser: false,
    ),
    ChatMessageModel(
      text: 'দাম জানতে চাই',
      isUser: true,
    ),
    ChatMessageModel(
      text: 'হোম ক্লিনিং ৮০০ টাকা থেকে শুরু। সব দাম দেখতে সেবা বিভাগে যান।',
      isUser: false,
    ),
  ].obs;

  final quickChips = <String>[
    StaticString.chipAcClean,
    StaticString.chipHomeClean,
    StaticString.chipPriceInfo,
    StaticString.chipHealthScore,
  ];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    final userMsg = text.trim();
    messages.add(ChatMessageModel(text: userMsg, isUser: true));
    messageController.clear();
    _scrollToBottom();

    // Auto Bot Response Simulation
    Future.delayed(const Duration(milliseconds: 600), () {
      String reply = 'আপনার বার্তার জন্য ধন্যবাদ! আমাদের সার্ভিস টিম শীঘ্রই আপনার সাথে যোগাযোগ করবে।';
      if (userMsg.contains('এসি') || userMsg.contains('AC')) {
        reply = 'এসি সার্ভিসিং সেবা মাত্র ১২০০ টাকায় বুক করতে পারেন! আমাদের দক্ষ টেকনিশিয়ান সার্ভিস দেবে।';
      } else if (userMsg.contains('ক্লিন') || userMsg.contains('পরিষ্কার') || userMsg.contains('Clean')) {
        reply = 'হোম ক্লিনিং বা ডিপ ক্লিনিং সেবা বুক করতে পারেন! আমাদের পেশাদার টিম আপনার বাড়ি ঝকঝকে করে দেবে।';
      } else if (userMsg.contains('দাম') || userMsg.contains('মূল্য') || userMsg.contains('Price')) {
        reply = 'হোম ক্লিনিং ৮০০ টাকা থেকে শুরু। সব দাম দেখতে সেবা বিভাগে যান।';
      } else if (userMsg.contains('স্কোর') || userMsg.contains('হেলথ') || userMsg.contains('Score')) {
        reply = 'আপনার বর্তমান বাড়ির হেলথ স্কোর ৮৫/১০০। নিয়মিত ফিল্টার ও এসি চেক করলে স্কোর বাড়বে!';
      }

      messages.add(ChatMessageModel(text: reply, isUser: false));
      _scrollToBottom();
    });
  }

  void onChipTap(String chipKey) {
    final text = chipKey.tr;
    sendMessage(text);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
