import 'package:get/get.dart';
import '../../../../../../Core/AppRoute/app_route.dart';
import '../Model/my_bookings_model.dart';

class MyBookingsController extends GetxController {
  final selectedTabIndex = 0.obs;

  final allBookings = <CustomerBookingItemModel>[
    // Upcoming
    CustomerBookingItemModel(
      id: '1',
      serviceTitle: 'হোম ক্লিনিং',
      dateText: '৩ জুলাই',
      timeText: 'সকাল ১০:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৮০০',
      status: BookingStatus.upcoming,
    ),
    CustomerBookingItemModel(
      id: '2',
      serviceTitle: 'এসি ক্লিনিং',
      dateText: '৫ জুলাই',
      timeText: 'বিকাল ৩:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৬০০',
      status: BookingStatus.upcoming,
    ),

    // Completed
    CustomerBookingItemModel(
      id: '3',
      serviceTitle: 'হোম ক্লিনিং',
      dateText: '৩ জুলাই',
      timeText: 'সকাল ১০:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৮০০',
      status: BookingStatus.completed,
    ),
    CustomerBookingItemModel(
      id: '4',
      serviceTitle: 'এসি ক্লিনিং',
      dateText: '৫ জুলাই',
      timeText: 'বিকাল ৩:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৬০০',
      status: BookingStatus.completed,
    ),

    // Cancelled
    CustomerBookingItemModel(
      id: '5',
      serviceTitle: 'হোম ক্লিনিং',
      dateText: '৩ জুলাই',
      timeText: 'সকাল ১০:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৮০০',
      status: BookingStatus.cancelled,
    ),
    CustomerBookingItemModel(
      id: '6',
      serviceTitle: 'এসি ক্লিনিং',
      dateText: '৫ জুলাই',
      timeText: 'বিকাল ৩:০০',
      addressText: 'বাড়ি ৪৫, রোড ১২, ধানমন্ডি',
      priceText: '৳৬০০',
      status: BookingStatus.cancelled,
    ),
  ].obs;

  List<CustomerBookingItemModel> get filteredBookings {
    switch (selectedTabIndex.value) {
      case 0:
        return allBookings.where((item) => item.status == BookingStatus.upcoming).toList();
      case 1:
        return allBookings.where((item) => item.status == BookingStatus.completed).toList();
      case 2:
        return allBookings.where((item) => item.status == BookingStatus.cancelled).toList();
      default:
        return [];
    }
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void onBookingTap(CustomerBookingItemModel booking) {
    if (booking.status == BookingStatus.upcoming) {
      Get.toNamed(AppRoute.bookingTrackingScreen);
    } else if (booking.status == BookingStatus.completed) {
      Get.toNamed(AppRoute.rateServiceScreen);
    }
  }
}
