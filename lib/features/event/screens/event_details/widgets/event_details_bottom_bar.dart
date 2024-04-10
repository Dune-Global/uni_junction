import 'package:flutter/material.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TEventDetailsBottomBar extends StatelessWidget {
  const TEventDetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.light,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Register Now',
                style: TextStyle(
                  color: TColors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
