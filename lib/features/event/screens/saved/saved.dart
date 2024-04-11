import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/features/event/screens/saved/widgets/saved_appbar.dart';
import 'package:uni_junction/features/event/screens/saved/widgets/saved_events.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:get/get.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          PaintingBinding.instance.imageCache.clear();
          await eventController.fetchUserLikedEvents();
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              TPrimaryHeaderContainer(
                height: 150,
                backgroundColor: TColors.primary,
                child: Column(
                  children: [
                    TSavedEventAppBar(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TSavedEvents(),
            ],
          ),
        ),
      ),
    );
  }
}
