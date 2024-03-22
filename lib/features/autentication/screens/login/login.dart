import 'package:flutter/material.dart';
import 'package:uni_junction/common/styles/spacing_styles.dart';
import 'package:uni_junction/features/autentication/screens/login/widgets/login_form.dart';
import 'package:uni_junction/features/autentication/screens/login/widgets/login_heder.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              TLoginHeader(),

              SizedBox(height: TSizes.spaceBtwItems),

              /// From
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
