import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/common/widgets/heading_navigators/heading_navigator.dart';
import 'package:uni_junction/features/event/screens/home/widgets/home_appbar.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_all.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

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

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.defaultSpace),
                    // Search Container
                    const TSearchContainer(text: "Search for events"),
                  ],
                ),
              ),
            ),
            // Events This Month
            const TThisMonthEventCards()
          ],
        ),
      ),
    );
  }
}
