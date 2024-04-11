import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/features/event/screens/event_details/widgets/additional_information.dart';
import 'package:uni_junction/features/event/screens/event_details/widgets/event_details_bottom_bar.dart';
import 'package:uni_junction/features/event/screens/event_details/widgets/event_image.dart';
import 'package:uni_junction/features/event/screens/event_details/widgets/event_information.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key});

  final eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Center(
          child: Column(
            children: [
              Text('Event Details'),
              SizedBox(height: 6.0),
              Text(
                "Science & Technology",
                style: TextStyle(
                  color: TColors.darkGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Event Image with Heart Icon
              TEventImage(),
              const SizedBox(height: 32.0),

              // Event Details: Name, Location, Participants, Date
              const TEventDetails(),
              const SizedBox(height: 16.0),

              // Event Description
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description', // Title for the event description
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: TColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Displaying the description with Read More or Read Less option
                    buildDescription(),
                  ],
                ),
              ),

              // Additional Event Information
              const TAdditionalInformationWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TEventDetailsBottomBar(),
    );
  }

  Widget buildDescription() {
    const description =
        'Event Description goes here. You can provide a detailed description of the event to the users. This can include the purpose of the event, the agenda, and other important details. Make sure to keep it concise and informative. You can also include links to external resources if needed. Enjoy the event event event. Event Description goes here. You can provide a detailed description of the event to the users. This can include the purpose of the event, the agenda, and other important details. Make sure to keep it concise and informative. You can also include links to external resources if needed. Enjoy the event event event!';

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventController.isExpanded.value ||
                    description.split(' ').length <= 50
                ? description
                : '${description.split(' ').take(50).join(' ')}...',
            style: const TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (description.split(' ').length > 50) const SizedBox(height: 8.0),
          if (description.split(' ').length > 50)
            GestureDetector(
              onTap: () {
                eventController.isExpanded.value =
                    !eventController.isExpanded.value;
              },
              child: Text(
                eventController.isExpanded.value ? 'Read Less' : 'Read More',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: TColors.darkerGrey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
