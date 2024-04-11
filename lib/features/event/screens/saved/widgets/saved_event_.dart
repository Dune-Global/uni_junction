import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_cards.dart';
import 'package:uni_junction/features/event/screens/saved/widgets/saved_appbar.dart';
import 'package:uni_junction/test/test_page.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class TSavedEventCards extends StatelessWidget {
  final int id;
  final String date;
  final String month;
  final String eventName;
  final String location;
  final String imageUrl;

  TSavedEventCards({
    Key? key,
    required this.id,
    required this.date,
    required this.month,
    required this.eventName,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

factory TSavedEventCards.fromJson(Map<String, dynamic> json) {
    return TSavedEventCards(
      id: json['id'],
      eventName: json['eventName'],
      location: json['location'],
      date: json['date'],
      month: json['month'],
      imageUrl: json['imageUrl'],
    );
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Use the parameters here to build your widget.
      ],
    );
  }
}