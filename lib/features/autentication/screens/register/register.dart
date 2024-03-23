import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/styles/spacing_styles.dart';
import 'package:uni_junction/features/autentication/screens/register/widgets/register_form.dart';
import 'package:uni_junction/features/autentication/screens/register/widgets/register_header.dart';
import 'package:uni_junction/utils/constants/sizes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              TRegisterHeader(),

              SizedBox(height: TSizes.spaceBtwItems),

              TRegisterForm(),
              /// From
              // TRegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
