import "package:flutter/material.dart";
import 'package:uni_junction/utils/constants/colors.dart';

class TAdditionalInformationWidget extends StatelessWidget {
  const TAdditionalInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: const TextSpan(
            text: 'Start Time: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '9:00 AM',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        RichText(
          text: const TextSpan(
            text: 'End Time: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '5:00 PM',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        const Text(
          'This is a private event',
          style: TextStyle(
            fontSize: 16.0,
            color: TColors.error,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
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
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'In-person',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: const TextSpan(
            text: 'Ticket Price: ',
            style: TextStyle(
              fontSize: 16.0,
              color: TColors.darkerGrey,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Rs.5000.00',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
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
