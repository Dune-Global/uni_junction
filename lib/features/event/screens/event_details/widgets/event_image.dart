import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TEventImage extends StatelessWidget {
  TEventImage({super.key});
  final eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
              onPressed: () => eventController.toggleHeart(),
              icon: Icon(
                eventController.isHeart.value ? Iconsax.heart : Iconsax.heart5,
                color: eventController.isHeart.value
                    ? TColors.white
                    : TColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
