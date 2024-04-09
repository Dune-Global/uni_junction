import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/common/widgets/loaders/shimmer_loader.dart';
import 'package:uni_junction/features/personalization/controllers/user_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.profileLodaing.value) {
              return const TShimmerEffect(width: 200, height: 20);
            }
            return Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColors.accent));
          }),
          const SizedBox(height: TSizes.sm),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: TColors.darkGrey,
                size: 18,
              ),
              const SizedBox(width: 5),
              Obx(() {
                if (controller.profileLodaing.value) {
                  return const TShimmerEffect(width: 100, height: 20);
                }
                return Flexible(
                  child: Text(
                    controller.user.value.university,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.darkGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      actions: [
        Obx(() {
          if (controller.profileLodaing.value) {
            return const TShimmerEffect(width: 50, height: 50);
          }
          return CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              controller.user.value.profilePicture,
            ),
          );
        }),
      ],
    );
  }
}
