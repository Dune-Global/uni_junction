// ignore_for_file: dead_code_on_catch_subtype

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_junction/data/repositories/authentication/authentication_repository.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';
import 'package:uni_junction/features/personalization/models/user_model.dart';
import 'package:uni_junction/utils/exceptions/firebase_exceptions.dart';
import 'package:uni_junction/utils/exceptions/format_exceptions.dart';
import 'package:uni_junction/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user
  Future<void> savedUserRecord(UserModel user) async {
    try {
      return await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  // Fetch user details
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  // push events to users likedEvents array
  Future<void> pushLikedEvents(String eventId) async {
    try {
      final user = await fetchUserDetails();
      return await _db.collection("Users").doc(user.id).update({
        'likedEvents': FieldValue.arrayUnion([eventId])
      });
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  // remove events from users likedEvents array
  Future<void> removeLikedEvents(String eventId) async {
    try {
      final user = await fetchUserDetails();
      return await _db.collection("Users").doc(user.id).update({
        'likedEvents': FieldValue.arrayRemove([eventId])
      });
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  // check if user has liked the event
  Future<bool> hasLikedEvent(String eventId) async {
    try {
      final user = await fetchUserDetails();
      return user.likedEvents.contains(eventId);
    } catch (e) {
      throw e;
    }
  }
  // Get user liked events
  Future<List<EventModel>> getUserLikedEvents() async {
    try {
      final user = await fetchUserDetails();
      final likedEventIds = user.likedEvents;

      // Print likedEventIds
      print('Liked event ids: $likedEventIds');

      final List<EventModel> likedEvents = [];
      for (var eventId in likedEventIds) {
        final doc = await _db.collection("Events").doc(eventId).get();
        if (doc.exists) {
          likedEvents.add(EventModel.fromSnapshot(doc));
        }
      }
      return likedEvents;
    } catch (e) {
      throw e;
    }
  }
  //update user
  Future<void> updateUser(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }


 Future<String> uploadImage(String path, XFile image) async {
  try {
    print('Uploading image...');
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    print('Image uploaded successfully. URL: $url');
    return url;
  } catch (e) {
    print('Error uploading image: $e');
    throw e;
  }
}
}
