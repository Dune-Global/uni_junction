import 'package:get/get.dart';
import 'package:uni_junction/features/event/screens/explore/category/category.dart';

class SavedEventsController extends GetxController {
  var savedEvents = <Event>[].obs;

  void saveEvent(Event event) {
    savedEvents.add(event);
  }
}