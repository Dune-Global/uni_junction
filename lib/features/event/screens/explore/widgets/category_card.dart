import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/category_controller.dart';
import 'package:uni_junction/features/event/screens/explore/category/category.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final int numberOfEvents;
  CategoryCard({
    super.key,
    required this.text,
    required this.imageUrl,
    this.numberOfEvents = 0,
  });
  final categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          categoryController.categoryName.value = text;
          await categoryController.fetchEventByCategory(text);
          Get.to(() => CategoryScreen(
                numberOfEvents: numberOfEvents,
              ));
        },
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Ink.image(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                        child: Container(),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: SizedBox.expand(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '$numberOfEvents events',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
