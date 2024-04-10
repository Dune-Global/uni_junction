import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/category_card.dart';
import 'package:uni_junction/data/services/explore/categories_data.dart';
import 'package:uni_junction/features/event/controllers/event/category_controller.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
       GridView.builder(
        controller: controller.categoryCounts.isEmpty ? null : ScrollController(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          final count = controller.categoryCounts[category['text']] ?? 0;
          return CategoryCard(
            text: category['text']!,
            imageUrl: category['imageUrl']!,
            numberOfEvents: count,
          );
        },
      )
    );
  }
}
