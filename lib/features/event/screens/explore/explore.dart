import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/categories_grid.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore"),
            Text(
              "Find events near you",
              style: TextStyle(
                color: TColors.grey,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          PaintingBinding.instance.imageCache.clear();

          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TSearchContainer(
                text: "Search for events",
                color: TColors.black,
              ),
              const SizedBox(height: TSizes.defaultSpace),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: CategoriesGrid(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
