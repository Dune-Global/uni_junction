import 'package:get/get.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';

class CategoryController extends GetxController {
  var categoryCounts = <String, int>{'default': 0}.obs;
  final eventRepository = Get.put(EventRepository());

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
}