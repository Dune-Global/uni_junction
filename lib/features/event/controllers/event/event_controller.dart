import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';
import 'package:uni_junction/features/personalization/controllers/user_controller.dart';
import 'package:uni_junction/navigation_menu.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/popup/full_screen_loader.dart';
import 'package:uni_junction/data/services/university/universities.dart';
import 'package:uni_junction/data/services/event_category/event_category_list.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();
  final controller = Get.put(UserController());

  final isPrivate = false.obs;
  final isOrg = false.obs;
  final isTicketed = false.obs;
  final isOnline = false.obs;
  final isExpanded = false.obs;
  final isHeart = false.obs;

  final selectedUniversity = 'Select a university'.obs;
  final universityList = universityLists.obs;

  final selectedEventCategory = 'Select a category'.obs;
  final eventCategoryList = eventCategoryLists.obs;

  // Variables
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final startTime = TextEditingController();
  final endTime = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  final eventUrl = TextEditingController();
  final orgName = TextEditingController();
  final ticketPrice = TextEditingController();
  final headCount = TextEditingController();

  // Seletcted Event details
  final selectedTitle = ''.obs;
  final selectedDescription = ''.obs;
  final selectedStartDate = ''.obs;
  final selectedEndDate = ''.obs;
  final selectedStartTime = ''.obs;
  final selectedEndTime = ''.obs;
  final selectedLocation = ''.obs;
  final selectedEventUrl = ''.obs;
  final selectedOrgName = ''.obs;
  final selectedTicketPrice = ''.obs;
  final selectedHeadCount = ''.obs;
  final selectedIsOnline = false.obs;
  final selectedIsOrg = false.obs;
  final selectedIsPrivate = false.obs;
  final selectedIsTicketed = false.obs;


  GlobalKey<FormState> eventFormKey = GlobalKey<FormState>();

  void toggleHeart() {
    isHeart.value = !isHeart.value;
  }

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

  // Method to parse time
  DateTime parseTime(String time) {
    List<String> parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1].split(' ')[0]);

    // Adjust hour if it's PM
    if (parts[1].contains('pm') && hour != 12) {
      hour += 12;
    }

    // Adjust hour if it's 12AM
    if (parts[1].contains('am') && hour == 12) {
      hour = 0;
    }

    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
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
        id: controller.user!.value.id + DateTime.now().toString(),
        userId: controller.user!.value.id,
        title: title.text.trim(),
        description: description.text.trim(),
        startDate: DateTime.parse(startDate.text.trim()),
        endDate: DateTime.parse(endDate.text.trim()),
        startTime: parseTime(startTime.text.trim()),
        endTime: parseTime(endTime.text.trim()),
        imageUrl: "",
        location: location.text.trim(),
        eventUrl: eventUrl.text.trim(),
        orgName: orgName.text.trim(),
        ticketPrice: ticketPrice.text.trim(),
        isOrg: isOrg.value,
        isPrivate: isPrivate.value,
        isTicketed: isTicketed.value,
        isOnline: isOnline.value,
        eventCategory: selectedEventCategory.value,
        university: selectedUniversity.value,
        headCount: headCount.text.trim(),
      );

      // Save event data in the firebase firestore
      final eventRepository = Get.put(EventRepository());
      await eventRepository.savedEventRecord(newEvent);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar("Success", "Event created successfully");
      Get.to(() => const NavigationMenu());

      // clear the form
      title.clear();
      description.clear();
      startDate.clear();
      endDate.clear();
      startTime.clear();
      endTime.clear();
      location.clear();
      eventUrl.clear();
      orgName.clear();
      ticketPrice.clear();
      headCount.clear();
      isOnline.value = false;
      isOrg.value = false;
      isPrivate.value = false;
      isTicketed.value = false;
      selectedEventCategory.value = 'Select a category';
      selectedUniversity.value = 'Select a university';
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
