import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_junction/data/repositories/user/user_repository.dart';
import 'package:uni_junction/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLodaing = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLodaing.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLodaing.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLodaing.value = false;
    }
  }
}
