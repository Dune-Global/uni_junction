import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/autentication/controllers/register/register_controller.dart';
import 'package:uni_junction/features/autentication/screens/register/widgets/terms_conditions_checkbox.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/validator/validation.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.registerFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.firstName,
              validator: (value) =>
                  TValidator.validationEmptyText("First Name", value),
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
            SizedBox(height: TSizes.spaceBtwInputFields),
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
            SizedBox(height: TSizes.spaceBtwInputFields),
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
            SizedBox(height: TSizes.spaceBtwInputFields),
            DropdownButtonFormField<String>(
              value: controller.selectedUniversity.value,
              validator: (value) => TValidator.validationEmptyText("University", value),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Iconsax.activity),
                  ),
                ),
                labelText: TTexts.university,
              ),
              items: controller.universityList.map((String university) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.topCenter,
                  value: university,
                  child: Container(
                    width: 200,
                    child: Text(
                      university,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) { 
                if (newValue != null) { 
                  controller.selectedUniversity.value = newValue;
                }
              },
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
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
                    onPressed: () => controller.hidePassword(),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                  labelText: TTexts.password,
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TTermsAndConditionCheckbox(),
            SizedBox(height: TSizes.spaceBtwSections * 1.5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.register(),
                child: const Text(TTexts.createAccount),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${TTexts.loginTitle} ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
