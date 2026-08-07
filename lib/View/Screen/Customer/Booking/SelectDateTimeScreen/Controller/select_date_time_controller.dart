import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../Model/select_date_time_model.dart';

class SelectDateTimeController extends GetxController {
  final selectedDateId = '1'.obs;
  final selectedTimeSlotId = '3'.obs;

  final dates = <BookingDateModel>[
    BookingDateModel(id: '1', dayOfWeek: 'আজ', dateText: '৩ জুলাই', fullLabel: 'আজ, ৩ জুলাই'),
    BookingDateModel(id: '2', dayOfWeek: 'শুক্র', dateText: '৪ জুলাই', fullLabel: 'শুক্র, ৪ জুলাই'),
    BookingDateModel(id: '3', dayOfWeek: 'শনি', dateText: '৫ জুলাই', fullLabel: 'শনি, ৫ জুলাই'),
    BookingDateModel(id: '4', dayOfWeek: 'রবি', dateText: '৬ জুলাই', fullLabel: 'রবি, ৬ জুলাই'),
    BookingDateModel(id: '5', dayOfWeek: 'সোম', dateText: '৭ জুলাই', fullLabel: 'সোম, ৭ জুলাই'),
  ].obs;

  final timeSlots = <BookingTimeSlotModel>[
    BookingTimeSlotModel(id: '1', period: 'সকাল', timeText: '৮:০০', fullLabel: 'সকাল ৮:০০'),
    BookingTimeSlotModel(id: '2', period: 'সকাল', timeText: '৯:০০', fullLabel: 'সকাল ৯:০০'),
    BookingTimeSlotModel(id: '3', period: 'সকাল', timeText: '১০:০০', fullLabel: 'সকাল ১০:০০'),
    BookingTimeSlotModel(id: '4', period: 'সকাল', timeText: '১১:০০', fullLabel: 'সকাল ১১:০০'),
    BookingTimeSlotModel(id: '5', period: 'দুপুর', timeText: '১২:০০', fullLabel: 'দুপুর ১২:০০'),
    BookingTimeSlotModel(id: '6', period: 'বিকাল', timeText: '২:০০', fullLabel: 'বিকাল ২:০০'),
    BookingTimeSlotModel(id: '7', period: 'বিকাল', timeText: '৩:০০', fullLabel: 'বিকাল ৩:০০'),
    BookingTimeSlotModel(id: '8', period: 'বিকাল', timeText: '৪:০০', fullLabel: 'বিকাল ৪:০০'),
  ].obs;

  BookingDateModel get selectedDateModel {
    return dates.firstWhere(
      (item) => item.id == selectedDateId.value,
      orElse: () => dates.first,
    );
  }

  BookingTimeSlotModel get selectedTimeSlotModel {
    return timeSlots.firstWhere(
      (item) => item.id == selectedTimeSlotId.value,
      orElse: () => timeSlots.first,
    );
  }

  void selectDate(String id) {
    selectedDateId.value = id;
  }

  void selectTimeSlot(String id) {
    selectedTimeSlotId.value = id;
  }

  void onNextPressed() {
    Get.toNamed(
      AppRoute.bookingReviewScreen,
      arguments: {
        'date': selectedDateModel.fullLabel,
        'time': selectedTimeSlotModel.fullLabel,
      },
    );
  }
}
