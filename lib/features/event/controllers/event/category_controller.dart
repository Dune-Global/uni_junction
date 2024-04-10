import 'package:get/get.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';

class CategoryController extends GetxController {
  var categoryCounts = <String, int>{'default': 0}.obs;
  final EventRepository _eventRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchCategoryCounts();
  }

  void fetchCategoryCounts() async {
    final counts = await _eventRepository.getEventCategoryCounts();
    categoryCounts.assignAll(counts);
  }
}