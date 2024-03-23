import 'package:flutter/material.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/helpers/helper_functions.dart';

class TRegisterHeader extends StatelessWidget {
  const TRegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: THelperFunctions.screenHeight() * 0.02,
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
            height: THelperFunctions.screenHeight() * 0.07,
            image: const AssetImage(
              TImages.lightAppLogo,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            TTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          TTexts.signupSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
      ],
    );
  }
}
