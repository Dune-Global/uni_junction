import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TEventDetailsBottomBar extends StatefulWidget {
  TEventDetailsBottomBar({Key? key}) : super(key: key);

  @override
  _TEventDetailsBottomBarState createState() => _TEventDetailsBottomBarState();
}

class _TEventDetailsBottomBarState extends State<TEventDetailsBottomBar> {
  final eventController = Get.put(EventController());
  late Future<bool> isUserAttending;

  @override
  void initState() {
    super.initState();
    isUserAttending = eventController.isUserAttendingEvent(eventController.selectedEventId.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 65.0,
        decoration: const BoxDecoration(
          color: TColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventController.isRegistered.value.toString(),
                style: TextStyle(
                  color: TColors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Participation',
                    style: TextStyle(
                      color: TColors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'In-person',
                    style: TextStyle(
                      color: TColors.darkGrey,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  eventController.toggleRegister(eventController.selectedEventId.value);
                  setState(() {
                    isUserAttending = eventController.isUserAttendingEvent(eventController.selectedEventId.value);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.light,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: FutureBuilder<bool>(
                  future: isUserAttending,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Icon(Icons.error);
                    } else {
                      return Text(
                        snapshot.data! ? 'Participating' : 'Register',
                        style: const TextStyle(
                          color: TColors.primary,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}