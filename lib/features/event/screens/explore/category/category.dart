import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/common/widgets/heading_navigators/heading_navigator.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/category_events.dart';
import 'package:uni_junction/features/event/screens/home/widgets/home_appbar.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_all.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/features/event/controllers/event/category_controller.dart';

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

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, this.numberOfEvents = 0});

  final int numberOfEvents;

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              height: 170,
              backgroundColor: TColors.primary,
              child: Column(
                children: [
                  TAppBar(
                    title: Center(
                      child: Column(
                        children: [
                          Obx(
                            () => Text(
                              controller.categoryName.value,
                              style: TextStyle(
                                  color: TColors.accent, fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: TSizes.sm,
                          ),
                          numberOfEvents > 0
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Explore these ",
                                        style: const TextStyle(
                                          color: TColors.softGrey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: numberOfEvents.toString(),
                                        style: const TextStyle(
                                          color: TColors.softGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Events ',
                                        style: const TextStyle(
                                            color: TColors.softGrey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "instantly",
                                        style: const TextStyle(
                                          color: TColors.softGrey,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(), // Render an empty Container when numberOfEvents is 0
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Events This Month
            const TCategoryEvents()
          ],
        ),
      ),
    );
  }
}
