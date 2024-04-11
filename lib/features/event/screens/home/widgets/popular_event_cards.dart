import 'package:flutter/material.dart';
import 'package:uni_junction/features/event/screens/home/home.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TPopularEventCards extends StatelessWidget {
  const TPopularEventCards({
    super.key,
    required this.events,
  });

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          Event event = events[index];
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
                          image: NetworkImage(event.imageUrl),
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
                                  event.date.split(' ')[0],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.white),
                                ),
                                Text(
                                  event.date.split(' ')[1],
                                  style: const TextStyle(
                                      fontSize: 16, color: TColors.white),
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.all(7),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.location_on,
                                    color: TColors.accent,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        event.eventName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(color: TColors.grey),
                                      ),
                                      Text(
                                        event.location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .apply(
                                              color: TColors.accent.withOpacity(0.7),
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
    );
  }
}
