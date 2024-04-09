import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/event/screens/create_event/create_event.dart';
import 'package:uni_junction/features/event/screens/explore/explore.dart';
import 'package:uni_junction/features/event/screens/home/home.dart';
import 'package:uni_junction/features/event/screens/profile/profile.dart';
import 'package:uni_junction/features/event/screens/saved/saved.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: TColors.primary,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: controller.selectedIndex.value == 0
                  ? Icon(
                      Iconsax.home5,
                      color: TColors.accent,
                      fill: 1.0,
                    )
                  : Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 1
                  ? Icon(Iconsax.calendar_tick5, color: TColors.accent)
                  : Icon(Iconsax.calendar_tick),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 2
                  ? Icon(Iconsax.add5, color: TColors.accent)
                  : Icon(Iconsax.add),
              label: 'Create',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 3
                  ? Icon(Iconsax.heart5, color: TColors.accent)
                  : Icon(Iconsax.heart),
              label: 'Saved',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 4
                  ? Icon(Iconsax.user_tag1, color: TColors.accent)
                  : Icon(Iconsax.user_tag),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(
        () => Container(
          child: controller.screens[controller.selectedIndex.value],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    ExploreScreen(),
    const CreateEventScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];
}
