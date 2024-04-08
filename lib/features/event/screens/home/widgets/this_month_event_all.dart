import 'package:flutter/material.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_cards.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class TThisMonthEventCards extends StatelessWidget {
  const TThisMonthEventCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EventThisMonth(
          date: "12",
          month: "Jan",
          eventName: "Google I/O 24",
          location: "Colombo, Sri Lanka",
          imageUrl: "https://unsplash.it/645/411",
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
      ],
    );
  }
}
