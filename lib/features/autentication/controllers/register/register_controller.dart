import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/loaders/snackbar_popup.dart';
import 'package:uni_junction/data/repositories/authentication/authentication_repository.dart';
import 'package:uni_junction/data/repositories/user/user_repository.dart';
import 'package:uni_junction/features/personalization/models/user_model.dart';
import 'package:uni_junction/utils/constants/image_strings.dart';
import 'package:uni_junction/utils/popup/full_screen_loader.dart';
import 'package:uni_junction/data/services/university/universities.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Add these lines
  final selectedUniversity = 'Select a university'.obs;
  final universityList = universityLists.obs;

  /// Register
  void register() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information", TImages.onBoardingImage2);

      // Form validation
      if (!registerFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the firebase authentication & save user data in the firebase
      final userCredentials = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        profilePicture: 'https://avatar.iran.liara.run/public',
        university: selectedUniversity.value,
        likedEvents: [],
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.savedUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar("Success", "User registered successfully");

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(
          "Error", e.toString().replaceAll("Exception:", ""));
      TFullScreenLoader.stopLoading();
    }
  }
}
