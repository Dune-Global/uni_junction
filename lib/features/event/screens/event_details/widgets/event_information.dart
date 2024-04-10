import 'package:flutter/material.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TEventDetails extends StatelessWidget {
  const TEventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  const Text(
                    "Google I/O '24",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Chip(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    labelPadding: const EdgeInsets.all(0),
                    label: const Text(
                      'By FOSS NSBM',
                      style: TextStyle(
                        color: TColors.white,
                        fontSize: 10.0,
                      ),
                    ),
                    backgroundColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: TColors.darkGrey,
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        'Colombo, Sri Lanka',
                        style: TextStyle(
                          color: TColors.darkGrey,
                        ),
                      ),
                      SizedBox(height: 28.0),
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
              child: const Column(
                children: <Widget>[
                  Text(
                    '25',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: TColors.accent),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Apr', // Sample month
                    style: TextStyle(fontSize: 20, color: TColors.accent),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
