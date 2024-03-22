import 'package:uni_junction/features/autentication/screens/onboarding/onboarding.dart';
import 'package:uni_junction/utils/theme/theme.dart';
import 'package:uni_junction/utils/device/system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SystemOverlay(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        // darkTheme: TAppTheme.darkTheme,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
