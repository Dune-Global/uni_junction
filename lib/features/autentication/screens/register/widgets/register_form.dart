import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/autentication/controllers/register/register_controller.dart';
import 'package:uni_junction/features/autentication/screens/password_configuration/forget_password.dart';
import 'package:uni_junction/features/autentication/screens/register/widgets/terms_conditions_checkbox.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/validator/validation.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.registerFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) =>
                  TValidator.validationEmptyText("Email", value),
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
              controller: controller.firstName,
              validator: (value) =>
                  TValidator.validationEmptyText("Fist Name", value),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.user),
                  ),
                ),
                labelText: TTexts.firstName,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            TextFormField(
              controller: controller.lastName,
              validator: (value) =>
                  TValidator.validationEmptyText("Last Name", value),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.user),
                  ),
                ),
                labelText: TTexts.lastName,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  TValidator.validationEmptyText("Username", value),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.user_cirlce_add),
                  ),
                ),
                labelText: TTexts.username,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    TValidator.validationEmptyText("Password", value),
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Iconsax.password_check),
                    ),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(controller.hidePassword.value == true
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                  labelText: TTexts.password,
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            const TTermsAndConditionCheckbox(),
            const SizedBox(height: TSizes.spaceBtwSections * 1.5),

            /// Sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.register(),
                    child: const Text(TTexts.createAccount))),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// Login button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.loginTitle} ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        text: TTexts.signIn,
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: TColors.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
