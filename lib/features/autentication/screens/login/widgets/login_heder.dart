import 'package:flutter/material.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: THelperFunctions.screenHeight() * 0.13,
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
            height: THelperFunctions.screenHeight() * 0.085,
            image: const AssetImage(
              TImages.lightAppLogo,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections * 1.5,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
      ],
    );
  }
}
