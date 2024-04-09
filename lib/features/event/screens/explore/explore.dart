import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/catergory_card.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          PaintingBinding.instance.imageCache.clear();

          return Future.delayed(
            const Duration(seconds: 1),
            () => setState(() {}),
          );
        },
        child: const SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Center(
            child: Column(
              children: [
                TSearchContainer(
                  text: "Search for events",
                  color: TColors.black,
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(height: TSizes.spaceBtwSections),
                CategoryCard(
                  // Use the CategoryCard widget here
                  text: 'Your Text',
                  imageUrl:
                      'https://unsplash.it/115/415', // Unsplash.it is now Picsum.photos
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
