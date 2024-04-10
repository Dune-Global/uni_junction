import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Center(child: Text('Event Details')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Event Image with Heart Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/event_detail_images/event_detail_image.png'), // Replace 'assets/event_image.jpg' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 350, // Adjust height as needed
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.heart,
                    color: Colors.white, // Change color as needed
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0), // Add more spacing here

            // Event Details: Name, Location, Participants, Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Google I/O '24",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add more spacing here
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey, // Change color as needed
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Colombo, Sri Lanka',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0), // Add more spacing here
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/event_detail_images/profile_image.jpg'), // Replace with actual profile image
                          radius: 12.0,
                        ),
                        SizedBox(width: 4.0),
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/event_detail_images/profile_image.jpg'), // Replace with actual profile image
                          radius: 12.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '2+ joined', // Number of participants
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(14), // Increased padding here
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: <Widget>[
                      Text(
                        '25', // Sample date
                        style: TextStyle(
                            fontSize: 24, // Increased font size here
                            fontWeight: FontWeight.bold,
                            color: TColors.accent),
                      ),
                      SizedBox(height: 5), // Increased spacing here
                      Text(
                        'Apr', // Sample month
                        style: TextStyle(
                            fontSize: 20, // Increased font size here
                            color: TColors.accent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Event Description
            Container(
              margin:
                  const EdgeInsets.only(top: 18.0), // Added margin to the top
              child: const Text(
                'Description', // Title for the event description
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: TColors.primary, // Adjust color as needed
                ),
              ),
            ),
            const SizedBox(height: 12.0), // Add spacing below the title
            const Text(
              'Event Description goes here. You can provide a detailed description of the event to the users. This can include the purpose of the event, the agenda, and other important details. Make sure to keep it concise and informative. You can also include links to external resources if needed. Enjoy the event event event event!',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}








