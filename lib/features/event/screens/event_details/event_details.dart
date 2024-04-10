import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Center(child: Text('Event Details')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 50.0), // Add bottom margin here
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
                            'assets/images/event_detail_images/event_detail_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 350,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

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
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
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
                      SizedBox(height: 12.0),
                      Row(
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
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                          style: TextStyle(
                              fontSize: 20, color: TColors.accent),
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
                    const EdgeInsets.only(top: 18.0),
                child: const Text(
                  'Description', // Title for the event description
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: TColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              // Displaying the description with Read More or Read Less option
              buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDescription() {
    const description =
        'Event Description goes here. You can provide a detailed description of the event to the users. This can include the purpose of the event, the agenda, and other important details. Make sure to keep it concise and informative. You can also include links to external resources if needed. Enjoy the event event event. Event Description goes here. You can provide a detailed description of the event to the users. This can include the purpose of the event, the agenda, and other important details. Make sure to keep it concise and informative. You can also include links to external resources if needed. Enjoy the event event event!';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded || description.split(' ').length <= 50
              ? description
              : '${description.split(' ').take(50).join(' ')}...',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[800],
            fontWeight: FontWeight.w300,
          ),
        ),
        if (description.split(' ').length > 50) const SizedBox(height: 8.0),
        if (description.split(' ').length > 50)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // Toggle the value of isExpanded
              });
            },
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
      ],
);
  }
}
