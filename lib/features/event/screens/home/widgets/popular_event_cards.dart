import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/features/event/screens/home/home.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/data/services/month/month_list.dart';

class TPopularEventCards extends StatelessWidget {
  TPopularEventCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    return GetBuilder<EventController>(
      init: eventController,
      initState: (_) {
        eventController.popularEvents();
      },
      builder: (controller) => Obx(
        () => SizedBox(
          height: 200,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: controller.popularEvents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 0 : 10.0,
                  right: 10.0,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            // Background Image
                            Ink.image(
                              image: NetworkImage(
                                  controller.popularEvents[index].imageUrl),
                              fit: BoxFit.cover,
                              child: Container(),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.85),
                                  ],
                                ),
                              ),
                              child: const SizedBox.expand(),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      controller.popularEvents[index].startDate
                                          .toString()
                                          .split(' ')[0]
                                          .split('-')[2],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      monthAbbreviations[controller
                                          .popularEvents[index].startDate
                                          .toString()
                                          .split(' ')[0]
                                          .split('-')[1]]!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: const EdgeInsets.all(7),
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.location_on,
                                        color: TColors.darkGrey,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            controller
                                                .popularEvents[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .apply(color: TColors.accent),
                                          ),
                                          Text(
                                            controller
                                                .popularEvents[index].location,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .apply(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
