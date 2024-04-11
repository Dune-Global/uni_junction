import 'dart:ffi';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:uni_junction/data/services/event_category/event_category_list.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TAdditionalInformationWidget extends StatelessWidget {
  TAdditionalInformationWidget({super.key});

  final eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'Start Time: ',
            style: const TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: eventController.selectedEndTime.value
                    .split(' ')[1]
                    .split('.')[0],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'End Time: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: eventController.selectedEndTime.value
                    .split(' ')[1]
                    .split('.')[0],
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        if (eventController.selectedIsPrivate.value)
          const Text(
            'This is a private event',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.error,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          )
        else
          const Text(
            'This is a public event',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: const TextSpan(
            text: 'Event Type: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'In-person',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'Ticket Price: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: eventController.selectedIsTicketed.value
                    ? eventController.selectedTicketPrice.value
                    : 'Free',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
