import 'package:get/get.dart';
import '../Model/home_timeline_model.dart';

class HomeTimelineController extends GetxController {
  final healthScore = 78.obs;
  final maxHealthScore = 100.obs;

  final historyGroups = <TimelineGroupModel>[
    TimelineGroupModel(
      monthTitle: 'জুলাই ২০২৫',
      items: [
        TimelineHistoryItemModel(
          title: 'হোম ক্লিনিং',
          dateText: '৩ জুলাই',
          statusText: 'আসন্ন',
          isUpcoming: true,
          iconEmoji: '🏠',
        ),
        TimelineHistoryItemModel(
          title: 'এসি ক্লিনিং',
          dateText: '৫ জুলাই',
          statusText: 'আসন্ন',
          isUpcoming: true,
          iconEmoji: '❄️',
        ),
      ],
    ),
    TimelineGroupModel(
      monthTitle: 'জুন ২০২৫',
      items: [
        TimelineHistoryItemModel(
          title: 'ইলেকট্রিশিয়ান',
          dateText: '২৮ জুন',
          statusText: 'সম্পন্ন',
          isUpcoming: false,
          iconEmoji: '⚡',
        ),
        TimelineHistoryItemModel(
          title: 'প্লাম্বার',
          dateText: '২০ জুন',
          statusText: 'সম্পন্ন',
          isUpcoming: false,
          iconEmoji: '🔧',
        ),
      ],
    ),
    TimelineGroupModel(
      monthTitle: 'মে ২০২৫',
      items: [
        TimelineHistoryItemModel(
          title: 'ডিপ ক্লিনিং',
          dateText: '১৫ মে',
          statusText: 'সম্পন্ন',
          isUpcoming: false,
          iconEmoji: '✨',
        ),
      ],
    ),
  ].obs;

  final upcomingMaintenances = <UpcomingMaintenanceItemModel>[
    UpcomingMaintenanceItemModel(
      title: 'এসি সার্ভিসিং',
      dueTimeText: 'পরের মাসে',
      iconEmoji: '❄️',
    ),
    UpcomingMaintenanceItemModel(
      title: 'ওয়াটার ট্যাংক',
      dueTimeText: '২ মাসের মধ্যে',
      iconEmoji: '💧',
    ),
  ].obs;

  void onBookMaintenancePressed(int index) {
    // Handle booking action
  }
}
