import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String profilePicture;
  String university;
  List<String> likedEvents;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.profilePicture,
      required this.university,
      required this.likedEvents});

// Helper funciton to get the full name
  String get fullName => "$firstName $lastName";

// Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

// Static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static function to create empty user model
  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      profilePicture: "",
      university: "",
      likedEvents: List.empty());

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "profilePicture": profilePicture,
      "university": university,
      "likedEvents": likedEvents
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data["firstName"] ?? "",
        lastName: data["lastName"] ?? "",
        username: data["username"] ?? "",
        email: data["email"] ?? "",
        profilePicture: data["profilePicture"] ?? "",
        university: data["university"] ?? "",
        likedEvents: List<String>.from(data["likedEvents"]) ?? List.empty(),
      );
    } else {
      return UserModel.empty();
    }
  }
}
