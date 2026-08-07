import 'package:get/get.dart';
import '../Model/booking_tracking_model.dart';

class BookingTrackingController extends GetxController {
  final trackingData = BookingTrackingDataModel(
    serviceTitle: 'এসি ক্লিনিং',
    dateTimeText: 'আজ, ৩ জুলাই • সকাল ১০:০০',
    statusTag: 'চলছে',
    technician: TechnicianModel(
      name: 'রহিম মিঞা',
      rating: 4.8,
      totalServicesCount: 524,
      phone: '01700-000000',
      avatarEmoji: '👨‍🔧',
    ),
    steps: [
      TrackingStepModel(
        id: '1',
        title: 'বুকিং নিশ্চিত',
        timeText: 'সকাল ৯:০০',
        status: TrackingStepStatus.completed,
      ),
      TrackingStepModel(
        id: '2',
        title: 'প্রফেশনাল নিযুক্ত',
        timeText: 'সকাল ৯:১৫',
        status: TrackingStepStatus.completed,
      ),
      TrackingStepModel(
        id: '3',
        title: 'প্রফেশনাল আসছেন',
        timeText: 'সকাল ৯:৪৫',
        status: TrackingStepStatus.active,
      ),
      TrackingStepModel(
        id: '4',
        title: 'সেবা শুরু',
        timeText: 'সকাল ১০:০০',
        status: TrackingStepStatus.pending,
      ),
      TrackingStepModel(
        id: '5',
        title: 'সেবা সম্পন্ন',
        timeText: '',
        status: TrackingStepStatus.pending,
      ),
    ],
  ).obs;

  void onCallTechnician() {
    Get.snackbar('কল করা হচ্ছে', '${trackingData.value.technician.name}-কে কল করা হচ্ছে...');
  }

  void onCompleteAndRate() {
    Get.back();
  }

  void onHelpPressed() {
    Get.snackbar('সাহায্য কেন্দ্র', 'আমাদের সাপোর্ট টিম আপনার সাথে শীঘ্রই যোগাযোগ করবে।');
  }
}
