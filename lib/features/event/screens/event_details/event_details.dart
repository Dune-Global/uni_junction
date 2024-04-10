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
      appBar: TAppBar(
        title: Center(
          child: Column(
            children: [
              const Text('Event Details'),
              const SizedBox(height: 6.0),
              Text(
                "Science & Technology",
                style: TextStyle(
                  color: Colors.grey[400],
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
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                child: Stack(
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
              ),
              const SizedBox(height: 32.0),

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
                              color: Colors.white,
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
                              color: Colors.grey,
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
              buildAdditionalInformation(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65.0,
        decoration: const BoxDecoration(
          color: TColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Participation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'In-person',
                    style: TextStyle(
                      color: TColors.darkGrey,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.light,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Register Now',
                  style: TextStyle(
                    color: TColors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
Widget buildAdditionalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'Start Time: ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
              fontWeight: FontWeight.w300,
            ),
            children: const <TextSpan>[
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
          text: TextSpan(
            text: 'End Time: ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
              fontWeight: FontWeight.w300,
            ),
            children: const <TextSpan>[
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
            color: Colors.red,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'Event Type: ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
              fontWeight: FontWeight.w300,
            ),
            children: const <TextSpan>[
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
          text: TextSpan(
            text: 'Ticket Price: ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
              fontWeight: FontWeight.w300,
            ),
            children: const <TextSpan>[
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
