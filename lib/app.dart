import 'package:flutter/widgets.dart';
import 'package:uni_junction/features/autentication/screens/onboarding/onboarding.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/theme/theme.dart';
import 'package:uni_junction/utils/device/system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SystemOverlay(
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.system,
          theme: TAppTheme.lightTheme,
          // darkTheme: TAppTheme.darkTheme,
          // home: const OnBoardingScreen(),
          home: const Scaffold(
            backgroundColor: TColors.borderPrimary,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
