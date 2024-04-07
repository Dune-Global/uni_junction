import 'package:flutter/material.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class THeadingNavigator extends StatelessWidget {
  final String title;
  final String buttonText;
  final Color titleColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  const THeadingNavigator({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
    this.titleColor = Colors.grey,
    this.buttonTextColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: titleColor),
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: buttonTextColor),
            ),
          ),
        ],
      ),
    );
  }
}