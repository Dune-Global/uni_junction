import 'package:flutter/material.dart';
import 'package:uni_junction/features/event/screens/explore/widgets/catergory_card.dart';
import 'package:uni_junction/data/services/explore/categories_data.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(
          text: categories[index]['text']!,
          imageUrl: categories[index]['imageUrl']!,
        );
      },
    );
  }
}