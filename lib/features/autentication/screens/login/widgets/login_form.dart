import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/autentication/screens/password_configuration/forget_password.dart';
import 'package:uni_junction/features/autentication/screens/register/register.dart';
import 'package:uni_junction/navigation_menu.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.direct_right),
                  ),
                ),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.password_check),
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Iconsax.eye_slash),
                  ),
                ),
                labelText: TTexts.password,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Remember me & forget passowrd

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// forget password
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.passwordReset1} ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        text: '${TTexts.passwordReset2} ',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: TColors.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => const ForgetPassword()),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 1.5),

            /// Sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu()),
                    child: const Text(TTexts.signIn))),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const RegisterScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
