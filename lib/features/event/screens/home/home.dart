import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/appbar/appbar.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.accent),
                        ),
                        const SizedBox(height: TSizes.sm),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: TColors.darkGrey,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              TTexts.homeAppbarSubTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: TColors.darkGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
