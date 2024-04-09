import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/models/event/event_model.dart';
import 'package:uni_junction/utils/exceptions/firebase_exceptions.dart';
import 'package:uni_junction/utils/exceptions/format_exceptions.dart';
import 'package:uni_junction/utils/exceptions/platform_exceptions.dart';

class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save event
  Future<void> savedEventRecord(EventModel event) async {
    try {
      return await _db.collection("Events").doc(event.id).set(event.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
