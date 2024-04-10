import 'package:flutter/material.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/categories_grid.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/explore_app_bar.dart';
import 'package:uni_junction/features/event/screens/home/widgets/search_container.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/category_controller.dart'; // Import CategoryController

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExploreAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          PaintingBinding.instance.imageCache.clear();
          await Get.find<CategoryController>().fetchCategoryCounts();
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: TSizes.defaultSpace),
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