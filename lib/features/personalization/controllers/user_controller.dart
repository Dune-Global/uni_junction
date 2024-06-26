import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  // Fetch user record
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

  // Update user

  updateRecord(UserModel user) async {
    await userRepository.updateUser(user);
  }

// Update profile picture

  // Update profile picture
  Future<void> updateProfilePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileLodaing.value = true;
      try {
        print('Updating profile picture...');
        final imageUrl = await userRepository.uploadImage(
            'profileImages/${user.value.id}', image);
        print('Profile picture updated. New URL: $imageUrl');
        final updatedUser = UserModel(
          id: user.value.id,
          firstName: user.value.firstName,
          lastName: user.value.lastName,
          username: user.value.username,
          email: user.value.email,
          profilePicture: imageUrl, // updated profile picture
          university: user.value.university,
          likedEvents: user.value.likedEvents,
        );
        await userRepository.updateUser(updatedUser);
        user(updatedUser);
      } finally {
        profileLodaing.value = false;
      }
    }
  }
}
