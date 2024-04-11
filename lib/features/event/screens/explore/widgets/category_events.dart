import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/category_controller.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/features/event/screens/event_details/event_details.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_cards.dart';
import 'package:uni_junction/test/test_page.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class TCategoryEvents extends StatelessWidget {
  const TCategoryEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final eventController = Get.put(EventController());

    return categoryController.eventsByCategory.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 220.0,
                horizontal: 50.0,
              ),
              child: Column(
                children: [
                  Image.network(
                    "https://img.freepik.com/free-vector/event-calendar-notification-freelancer-project-deadline-date-appointment-reminder-calendar-megaphone-isolated-design-element-time-management-concept-illustration_335657-1693.jpg",
                    width: 190,
                    height: 190,
                  ),
                  Text(
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                      "Sorry, there are no events currently for this category"),
                ],
              ),
            ),
          )
        : Column(
            children: categoryController.eventsByCategory.expand((event) {
              final startDate = DateFormat('d MMM').format(event.startDate);
              final defaultImageUrl = "https://unsplash.it/645/411";

              return [
                EventThisMonth(
                  date: startDate.split(' ')[0],
                  month: startDate.split(' ')[1],
                  eventName: event.title,
                  location: event.location ?? 'Location not provided',
                  imageUrl:
                      event.imageUrl.isEmpty ? defaultImageUrl : event.imageUrl,
                  onTap: () => {
                      eventController.selectedTitle.value = event.title,
                      eventController.selectedDescription.value = event.description,
                      eventController.selectedStartDate.value = event.startDate.toString(),
                      eventController.selectedEndDate.value = event.endDate.toString(),
                      eventController.selectedStartTime.value = event.startTime.toString(),
                      eventController.selectedEndTime.value = event.endTime.toString(),
                      eventController.selectedLocation.value = event.location,
                      eventController.selectedEventUrl.value = event.eventUrl.toString(),
                      eventController.selectedOrgName.value = event.orgName.toString(),
                      eventController.selectedTicketPrice.value = event.ticketPrice.toString(),
                      eventController.selectedHeadCount.value = event.headCount.toString(),
                      eventController.selectedIsOnline.value = event.isOnline.toString() == 'true',
                      eventController.selectedIsOrg.value = event.isOrg.toString() == 'true',
                      eventController.selectedIsPrivate.value = event.isPrivate.toString() == 'true',
                      eventController.selectedIsTicketed.value = event.isTicketed.toString() == 'true',

                    Get.to(
                      () => EventDetailsScreen(),
                    ),
                  },
                ),
                SizedBox(height: TSizes.spaceBtwSections),
              ];
            }).toList(),
          );
  }
}
