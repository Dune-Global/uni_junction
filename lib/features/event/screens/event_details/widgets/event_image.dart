import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TEventImage extends StatelessWidget {
  const TEventImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/event_detail_images/event_detail_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 350,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.heart,
              color: TColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
