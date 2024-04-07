import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/common/widgets/heading_navigators/heading_navigator.dart';
import 'package:uni_junction/features/event/screens/home/widgets/home_appbar.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/data/services/popular_events_data/popular_events_data.dart';

class Event {
  final int id;
  final String eventName;
  final String location;
  final String date;
  final String imageUrl;

  Event({
    required this.id,
    required this.eventName,
    required this.location,
    required this.date,
    required this.imageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      eventName: json['eventName'],
      location: json['location'],
      date: json['date'],
      imageUrl: json['imageUrl'],
    );
  }
}

List<Event> parseEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Event> events;

  @override
  void initState() {
    super.initState();
    String eventsJson = getEventsJson();
    events = parseEvents(eventsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Primary Header Container
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Home AppBar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Search Container
                  const TSearchContainer(text: "Search for events"),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Heading Navigator
                  THeadingNavigator(
                    title: "Popular Events",
                    buttonText: "View All",
                    buttonTextColor: TColors.accent,
                    titleColor: TColors.accent,
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // PageView Builder for Events
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) {
                        Event event = events[index];
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 0 : 10.0,
                            right: 10.0,
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: <Widget>[
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    children: <Widget>[
                                      // Background Image
                                      Ink.image(
                                        image: NetworkImage(event.imageUrl),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                      // Date Container
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                event.date.split(' ')[0],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                event.date.split(' ')[1],
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Event Details Container
                                Positioned(
                                  bottom: 0,
                                  left:
                                      MediaQuery.of(context).size.width * 0.08,
                                  child: Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.location_on,
                                            color: TColors.primary,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                event.eventName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .apply(
                                                        color: TColors.primary),
                                              ),
                                              Text(
                                                event.location,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .apply(
                                                      color: TColors.primary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            THeadingNavigator(
              title: "Events This Month",
              buttonText: "View All",
              buttonTextColor: TColors.primary,
              titleColor: TColors.primary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
