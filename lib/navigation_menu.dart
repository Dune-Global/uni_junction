import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/event/screens/create_event/create_event.dart';
import 'package:uni_junction/features/event/screens/explore/explore.dart';
import 'package:uni_junction/features/event/screens/home/home.dart';
import 'package:uni_junction/features/event/screens/profile/profile.dart';
import 'package:uni_junction/features/event/screens/saved/saved.dart';

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
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(Iconsax.calendar), label: 'Explore'),
            NavigationDestination(icon: Icon(Iconsax.add), label: 'Create'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Saved'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
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
    const ExploreScreen(),
    const CreateEventScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];
}
