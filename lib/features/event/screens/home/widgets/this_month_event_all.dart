import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/screens/event_details/event_details.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_cards.dart';
import 'package:uni_junction/test/test_page.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class TThisMonthEventCards extends StatelessWidget {
  const TThisMonthEventCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventThisMonth(
          date: "12",
          month: "Jan",
          eventName: "Google I/O 24",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/645/411",
          onTap: () => Get.to(() => EventDetailsScreen()),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        EventThisMonth(
          date: "03",
          month: "Dec",
          eventName: "Linux User Group",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/115/411",
          onTap: () => Get.to(() => TestScreen(
              title: "Linux User Group",
              description: "this is linux user group")),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        EventThisMonth(
          date: "31",
          month: "Apr",
          eventName: "MS Champs",
          location: "Microsoft, Sri Lanka",
          imageUrl: "https://unsplash.it/915/411",
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        EventThisMonth(
          date: "22",
          month: "Jul",
          eventName: "Arduino Day 2024",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/225/411",
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        EventThisMonth(
          date: "24",
          month: "Jul",
          eventName: "GDG Devfest 2024",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/224/411",
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        EventThisMonth(
          date: "09",
          month: "Aug",
          eventName: "KCD Sri Lanka 2024",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/687/411",
        ),
      ],
    );
  }
}
