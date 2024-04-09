import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/popup/full_screen_loader.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();

  // Variables
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final startTime = TextEditingController();
  final endTime = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  GlobalKey<FormState> eventFormKey = GlobalKey<FormState>();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2028));
    if (picked != null) {
      startDate.text = picked.toString().split(" ")[0];
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2028));
    if (picked != null) {
      endDate.text = picked.toString().split(" ")[0];
    }
  }

  // Add data to the firebase
  void addEvent() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Creating event", TImages.onBoardingImage3);

      // Form validation
      if (!eventFormKey.currentState!.validate()) {
        return;
      }

      // Add event data to the firebase
      final newEvent = EventModel(
        id: "",
        title: title.text.trim(),
        description: description.text.trim(),
        startDate: DateTime.parse(startDate.text.trim()),
        endDate: DateTime.parse(endDate.text.trim()),
        startTime: DateTime.parse(startTime.text.trim()),
        endTime: DateTime.parse(endTime.text.trim()),
        imageUrl: "",
        location: location.text.trim(),
      );

      // Save event data in the firebase firestore
      final eventRepository = Get.put(EventRepository());
      await eventRepository.savedEventRecord(newEvent);

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
