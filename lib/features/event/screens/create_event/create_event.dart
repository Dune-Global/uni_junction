import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/features/event/screens/create_event/widgets/create_event_appbar.dart';
import 'package:uni_junction/features/event/screens/create_event/widgets/create_event_form.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const TPrimaryHeaderContainer(
            height: 150,
            backgroundColor: TColors.primary,
            child: Column(
              children: [
                // Home AppBar
                TCreateEventAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
          TCreateEventForm(controller: controller),
        ],
      ),
    ));
  }
}
