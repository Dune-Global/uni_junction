import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/device/device_utility.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.color = TColors.grey,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.buttonRadiusFull),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.search_normal,
              color: color,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.apply(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
