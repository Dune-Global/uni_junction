import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
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
  final List<Map<String, String>> categories = [
    {
      'text': 'Category 1',
      'imageUrl': 'https://picsum.photos/200/300',
    },
    {
      'text': 'Category 2',
      'imageUrl': 'https://picsum.photos/200/300',
    },
    {
      'text': 'Category 3',
      'imageUrl': 'https://picsum.photos/200/300',
    },
    {
      'text': 'Category 4',
      'imageUrl': 'https://picsum.photos/200/300',
    },
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore"),
            Text("Find events near you",
                style: TextStyle(
                  color: TColors.grey,
                  fontSize: 12,
                ))
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          PaintingBinding.instance.imageCache.clear();

          return Future.delayed(
            const Duration(seconds: 1),
            () => setState(() {}),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              TSearchContainer(
                text: "Search for events",
                color: TColors.black,
              ),
              SizedBox(height: TSizes.defaultSpace),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.7, // adjust the value as needed
                      child: GridView.builder(
                        itemCount: categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // This creates 2 columns
                          crossAxisSpacing:
                              10.0, // This is the space between the columns
                          mainAxisSpacing:
                              10.0, // This is the space between the rows
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(
                            text: categories[index]['text']!,
                            imageUrl: categories[index]['imageUrl']!,
                          );
                        },
                      ),
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
