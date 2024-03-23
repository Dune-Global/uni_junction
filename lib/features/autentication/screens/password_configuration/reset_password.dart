import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/autentication/screens/login/login.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Image
            Lottie.asset(
              TImages.paperPlane,
              width: THelperFunctions.screenWidth() * 1,
              height: THelperFunctions.screenHeight() * 0.3,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Title & Subtitle
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const LoginScreen()),
                child: const Text(TTexts.done),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.mailDidNotReceive} ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        text: '${TTexts.mailDidNotReceiveAction} ',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: TColors.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {},
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}
