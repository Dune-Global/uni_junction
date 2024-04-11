import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/data/repositories/event/event_repository.dart';
import 'package:uni_junction/data/repositories/user/user_repository.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';
import 'package:uni_junction/features/event/screens/explore/category/category.dart';
import 'package:uni_junction/features/personalization/controllers/user_controller.dart';
import 'package:uni_junction/navigation_menu.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/popup/full_screen_loader.dart';
import 'package:uni_junction/data/services/university/universities.dart';
import 'package:uni_junction/data/services/event_category/event_category_list.dart';
import 'dart:convert';

class EventController extends GetxController {
  static EventController get instance => Get.find();
  final controller = Get.put(UserController());
  final pickedImage = Rxn<XFile>();
  final imageUrl = Rxn<String>();
  // var isImagePicked = false.obs;

  final isPrivate = false.obs;
  final isOrg = false.obs;
  final isTicketed = false.obs;
  final isOnline = false.obs;
  final isExpanded = false.obs;
  final isHeart = false.obs;
  final isRegistered = false.obs;

  final selectedUniversity = 'Select a university'.obs;
  final universityList = universityLists.obs;

  final selectedEventCategory = 'Select a category'.obs;
  final eventCategoryList = eventCategoryLists.obs;

  final userLikedEvents = <EventModel>[].obs;
  final popularEvents = <EventModel>[].obs;

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
  final selectedEventId = ''.obs;
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
  final selectedImageUrl = ''.obs;
  final selectedIsOnline = false.obs;
  final selectedIsOrg = false.obs;
  final selectedIsPrivate = false.obs;
  final selectedIsTicketed = false.obs;

  GlobalKey<FormState> eventFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getPopularEvents();
    hasLikedEvent(selectedEventId.value).then((value) {
      isHeart.value = value;
    });

    isUserAttendingEvent(selectedEventId.value).then((value) {
      isRegistered.value = value;
    });
  }

  void toggleHeart(String eventId) {
    isHeart.value = !isHeart.value;
    if (isHeart.value) {
      pushLikedEvents(eventId);
    } else {
      removeLikedEvents(eventId);
    }
  }

  void toggleRegister(String eventId) {
    isRegistered.value = !isRegistered.value;
    if (isRegistered.value) {
      registerUserForEvent(eventId);
    } else {
      removeUserFromEvent(eventId);
    }
  }

  Future<void> fetchUserLikedEvents() async {
    try {
      final userRepository = Get.put(UserRepository());
      final events = await userRepository.getUserLikedEvents();
      userLikedEvents.assignAll(events);

      // Convert each event to JSON and print it
      for (var event in events) {
        print(jsonEncode(event.toJson()));
      }
    } catch (e) {
      print(e.toString());
    }
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
        imageUrl: imageUrl.value ?? "",
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
      pickedImage.value = null;
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

  // create the likedEvents function
  Future<void> pushLikedEvents(String eventId) async {
    try {
      final userRepository = Get.put(UserRepository());
      userRepository.pushLikedEvents(eventId);
      TLoaders.successSnackBar("Success", "Event added to liked events");
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
    }
  }

  // remove the likedEvents function
  Future<void> removeLikedEvents(String eventId) async {
    try {
      final userRepository = Get.put(UserRepository());
      userRepository.removeLikedEvents(eventId);
      TLoaders.successSnackBar("Success", "Event removed from liked events");
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
    }
  }

  // return true or false is user has liked the event
  Future<bool> hasLikedEvent(String eventId) async {
    final userRepository = Get.put(UserRepository());
    return userRepository.hasLikedEvent(eventId);
  }

  // Add user to the attendee array
  Future<void> registerUserForEvent(String eventId) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Registering for event", TImages.onBoardingImage3);
      final eventRepository = Get.put(EventRepository());
      eventRepository.pushUser(eventId);
      isRegistered.value = true;
      TLoaders.successSnackBar("Success", "You have registered for the event");
      TFullScreenLoader.stopLoading();
      Get.to(() => const NavigationMenu());
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
      TFullScreenLoader.stopLoading();
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }

  // Remove user from the attendee array
  Future<void> removeUserFromEvent(String eventId) async {
    try {
      final eventRepository = Get.put(EventRepository());
      eventRepository.removeUser(eventId);
      isRegistered.value = false;
      TLoaders.successSnackBar(
          "Success", "You have unregistered from the event");
    } catch (e) {
      TLoaders.errorSnackBar("Error", e.toString());
    }
  }

  // Check if user is attending the event
  Future<bool> isUserAttendingEvent(String eventId) async {
    final eventRepository = Get.put(EventRepository());
    return eventRepository.isUserAttending(eventId);
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = image;
    }
    await uploadEventImage();
  }

  Future<void> uploadEventImage() async {
    if (pickedImage.value != null) {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('events/${DateTime.now().toIso8601String()}');
      final UploadTask uploadTask =
          storageReference.putFile(File(pickedImage.value!.path));
      await uploadTask.whenComplete(() => null);
      final String eventImageUrl =
          await storageReference.getDownloadURL(); // what is this? This is
      imageUrl.value = eventImageUrl;
    }
  }

  Future<void> getPopularEvents() async {
    try {
      final eventRepository = Get.put(EventRepository());
      final events = await eventRepository.getEventsByAttendees();
      popularEvents.assignAll(events);
      print("Popular events");
      print(popularEvents.length);

      // Convert each event to JSON and print it
      for (var event in events) {
        print(jsonEncode(event.toJson()));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
