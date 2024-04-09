import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/event/controllers/profile/profile.contoller.dart';
import 'package:uni_junction/features/personalization/controllers/user_controller.dart';
import 'package:uni_junction/features/personalization/models/user_model.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: NetworkImage(
                              'https://avatar.iran.liara.run/public/21')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        // Add your code here
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TColors.dark,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),

              Form(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Obx(() {
                        if (controller.profileLodaing.value) {
                          return const CircularProgressIndicator();
                        }
                        return TextFormField(
                          controller: TextEditingController(
                              text: controller.user.value.firstName),
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
                        );
                      }),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      Obx(() {
                        if (controller.profileLodaing.value) {
                          return const CircularProgressIndicator();
                        }
                        return TextFormField(
                          controller: TextEditingController(
                              text: controller.user.value.lastName),
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
                        );
                      }),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      Obx(() {
                        if (controller.profileLodaing.value) {
                          return const CircularProgressIndicator();
                        }
                        return TextFormField(
                          controller: TextEditingController(
                              text: controller.user.value.username),
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
                        );
                      }),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your code here
                          },
                          child: const Text(TTexts.save),
                        ),
                      ),
                    ],
                  ),
                ),
              )

              // TextFormField(
              //   decoration: const InputDecoration(
              //     prefixIcon: Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 20),
              //         child: Icon(Iconsax.password_check),
              //       ),
              //     ),
              //     suffixIcon: Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Padding(
              //         padding: EdgeInsets.only(right: 20),
              //         child: Icon(Iconsax.eye_slash),
              //       ),
              //     ),
              //     labelText: TTexts.password,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
