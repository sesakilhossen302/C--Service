import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../../../../../../Utils/CustomSnackbar/custom_snackbar.dart';
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
    CustomSnackbar.showInfo(
      title: 'কল করা হচ্ছে',
      message: '${trackingData.value.technician.name}-কে কল করা হচ্ছে...',
    );
  }

  void onCompleteAndRate() {
    Get.toNamed(AppRoute.rateServiceScreen);
  }

  void onHelpPressed() {
    Get.toNamed(AppRoute.helpSupportScreen);
  }
}
