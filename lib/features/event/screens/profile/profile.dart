import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_all.dart';
import 'package:uni_junction/features/event/screens/profile/widgets/editprofile.dart';
import 'package:uni_junction/features/personalization/controllers/user_controller.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Center(
            child: Column(
              children: [
                Obx(() {
                  if (controller.profileLodaing.value) {
                    return const CircularProgressIndicator();
                  }
                  return SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          image: NetworkImage(
                              controller.user.value.profilePicture)),
                    ),
                  );
                }),
                const SizedBox(height: TSizes.md),
                Obx(() {
                  if (controller.profileLodaing.value) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    controller.user.value.fullName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
                Obx(() {
                  if (controller.profileLodaing.value) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    controller.user.value.university,
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const EditProfile()),
                    child: const Text(TTexts.editProfile),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Column(
                  children: [
                    TThisMonthEventCards(),
                    SizedBox(
                      height: 25,
                    ),
                    TThisMonthEventCards(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
