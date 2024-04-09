import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/data/repositories/authentication/authentication_repository.dart';
import 'package:uni_junction/features/event/screens/home/home.dart';
import 'package:uni_junction/navigation_menu.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/popup/full_screen_loader.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  late GlobalKey<FormState> uniqueLoginFormKey;

  LoginController() {
    // Initialize uniqueLoginFormKey within the constructor
    uniqueLoginFormKey = GlobalKey<FormState>();
  }

  // Email & password signin
  Future<void> emailAndPasswordLogin() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', TImages.loadingImage);

      // Check if uniqueLoginFormKey is initialized
      if (uniqueLoginFormKey.currentState != null &&
          !uniqueLoginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      Get.offAll(() => const NavigationMenu()); 
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar("Oh Snap", e.toString());
    }
  }
}
