// system_overlay.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class SystemOverlay extends StatelessWidget {
  const SystemOverlay({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Set system overlays to make the app run in full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Set the status bar color to transparent
        systemNavigationBarColor: TColors.light, // Set the navigation bar color to your theme background color
      ),
    );

    return child;
  }
}
