import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.accent),
          ),
          const SizedBox(height: TSizes.sm),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: TColors.darkGrey,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                TTexts.homeAppbarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.darkGrey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              size: 25,
              color: TColors.light,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage:
              NetworkImage('https://avatar.iran.liara.run/public/21'),
        ),
      ],
    );
  }
}
