import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(children: [
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
                    TextFormField(
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
          ]),
        ),
      ),
    );
  }
}
