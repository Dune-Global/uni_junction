import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/data/services/month/month_list.dart';

class TEventDetails extends StatelessWidget {
  TEventDetails({super.key});

  final eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Event Details: Name, Location, Participants, Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventController.selectedTitle.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    eventController.selectedOrgName.value == ''
                        ? Container()
                        : Chip(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            labelPadding: const EdgeInsets.all(0),
                            label: Text(
                              'By ${eventController.selectedOrgName.value}',
                              style: const TextStyle(
                                color: TColors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            backgroundColor: TColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: TColors.darkGrey,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          eventController.selectedLocation.value,
                          style: const TextStyle(
                            color: TColors.darkGrey,
                          ),
                        ),
                        const SizedBox(height: 28.0),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/event_detail_images/profile_image.jpg'),
                          radius: 12.0,
                        ),
                        SizedBox(width: 4.0),
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/event_detail_images/profile_image.jpg'),
                          radius: 12.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '2+ joined', // Number of participants
                          style: TextStyle(
                            color: TColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      eventController.selectedStartDate.value
                          .split(' ')[0]
                          .split('-')[2],
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: TColors.accent),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // month only
                      monthAbbreviations[eventController.selectedStartDate.value
                          .split(' ')[0]
                          .split('-')[1]]!,
                      style:
                          const TextStyle(fontSize: 20, color: TColors.accent),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
