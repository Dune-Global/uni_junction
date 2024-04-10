import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/features/event/screens/create_event/widgets/create_event_appbar.dart';
import 'package:uni_junction/features/event/screens/create_event/widgets/create_event_form.dart';
import 'package:uni_junction/features/event/screens/home/widgets/this_month_event_all.dart';
import 'package:uni_junction/features/event/screens/saved/widgets/saved_appbar.dart';
import 'package:uni_junction/features/event/screens/saved/widgets/saved_event_.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Save = Get.put(SaveController());
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
            height: 150,
            backgroundColor: TColors.primary,
            child: Column(
              children: [
                // Home AppBar
                TSavedEventAppBar(),
                SizedBox(height: 20),
              ],
            ),
          ),
          // TCreateEventForm(controller: Save,),
          // TThisMonthEventCards(),
          SizedBox(height: 20),
        //  TSavedEventCards(),
        ],
      ),
    ));
  }
}
