import 'dart:math';

import 'package:get/get.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';

class CategoryController extends GetxController {
  final categoryName = ''.obs;
  var categoryCounts = <String, int>{'default': 0}.obs;
  final eventRepository = Get.put(EventRepository());
  var eventsByCategory = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategoryCounts();
  }

  Future<void> fetchCategoryCounts() async {
    try {
      final counts = await eventRepository.getEventCategoryCounts();
      categoryCounts.assignAll(counts);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchEventByCategory(String categoryName) async {
    try {
      final events = await eventRepository.getEventsByCategory(categoryName);
      eventsByCategory.assignAll(events);
      eventsByCategory.forEach((event) {
        
      });
    } catch (e) {
      print(e);
    }
  }
}
