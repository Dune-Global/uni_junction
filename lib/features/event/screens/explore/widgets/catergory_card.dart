import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  const CategoryCard({Key? key, required this.text, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/1, // This makes the card square
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0), // This makes the border rounded
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  // Background Image
                  Ink.image(
                    image: NetworkImage(imageUrl), // Use the imageUrl parameter here
                    fit: BoxFit.cover,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3, // adjust the width as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add some padding around the text
                  child: Text(
                    text,
                    style: TextStyle(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}