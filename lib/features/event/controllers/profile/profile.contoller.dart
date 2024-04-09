import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:uni_junction/data/repositories/authentication/authentication_repository.dart';
import 'package:uni_junction/data/repositories/authentication/user/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  getUserDate() {
    // final email = _authRepo.firebaseUser.value?.email;
    // if (email != null) {
    //   return _userRepo.getUserDetails(email);
    // }else{
    //   Get.snackbar("Error", "User not found");
    //   return Future.error('User not found');
    // }
  }
}
