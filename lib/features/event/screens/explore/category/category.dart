import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/heading_navigators/heading_navigator.dart';
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
            THeadingNavigator(
              title: "Events This Month",
              buttonText: "View All",
              buttonTextColor: TColors.primary,
              titleColor: TColors.primary,
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // Events This Month
            const TThisMonthEventCards()
          ],
        ),
      ),
    );
  }
}
