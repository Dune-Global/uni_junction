import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class EventThisMonth extends StatelessWidget {
  const EventThisMonth(
      {super.key,
      required this.eventName,
      required this.location,
      required this.date,
      required this.month,
      required this.imageUrl});

  final String eventName;
  final String location;
  final String date;
  final String month;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TLoaders.infoSnackBar("Hello", "You clicked on the card");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          height: 80,
          color: Colors.transparent,
          child: Row(
            children: [
              // Small Image on the left
              Container(
                width: 60,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Event details in the center
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.md,
                    right: TSizes.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: TColors.darkGrey,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 14,
                              color: TColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 30,
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              'https://avatar.iran.liara.run/public/21'))),
                                  Positioned(
                                      left: 18,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              'https://avatar.iran.liara.run/public/22'))),
                                  Positioned(
                                      left: 36,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              'https://avatar.iran.liara.run/public/20'))),
                                  Positioned(
                                      left: 54,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              'https://avatar.iran.liara.run/public/19'))),
                                  Positioned(
                                      left: 72,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              'https://avatar.iran.liara.run/public/25'))),
                                ],
                              ),
                            ),
                          ),
                          //Text('250+ joined', style: TextStyle(
                          //fontSize: 12,
                          //color: TColors.darkGrey,
                          //),),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // Date on the right
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          date,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: TColors.accent),
                        ),
                        Text(
                          month,
                          style: const TextStyle(
                              fontSize: 16, color: TColors.accent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
