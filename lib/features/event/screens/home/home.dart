import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/common/widgets/heading_navigators/heading_navigator.dart';
import 'package:uni_junction/features/event/screens/home/widgets/home_appbar.dart';
import 'package:uni_junction/features/event/screens/home/widgets/popular_event_cards.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_all.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_cards.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/data/services/popular_events_data/popular_events_data.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          // Clear the image cache
          PaintingBinding.instance.imageCache.clear();

          // Then trigger a rebuild of the widget
          return Future.delayed(
            const Duration(seconds: 1),
            () => {}
          );
        },
        child: SingleChildScrollView(
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
                    TPopularEventCards(),
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
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // Events This Month
             TThisMonthEventCards(),
            ],
          ),
        ),
      ),
    );
  }
}
