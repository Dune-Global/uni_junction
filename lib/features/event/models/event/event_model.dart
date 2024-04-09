import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  String title;
  String description;
  String? eventUrl;
  DateTime startDate;
  DateTime? endDate;
  DateTime? startTime;
  DateTime? endTime;
  String imageUrl;
  String location;
  bool? isPublic;
  bool? isOrg;
  String? orgName;
  bool? isTicketed;
  String? ticketPrice;

  EventModel(
      {required this.id,
      required this.title,
      required this.description,
      this.eventUrl,
      required this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      required this.imageUrl,
      required this.location,
      this.isPublic,
      this.isOrg,
      this.orgName,
      this.isTicketed,
      this.ticketPrice});

  // Static function to create empty event model
  static EventModel empty() => EventModel(
        id: "",
        title: "",
        description: "",
        startDate: DateTime.now(),
        imageUrl: "",
        location: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "eventUrl": eventUrl,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime,
      "imageUrl": imageUrl,
      "location": location,
      "isPublic": isPublic,
      "isOrg": isOrg,
      "orgName": orgName,
      "isTicketed": isTicketed,
      "ticketPrice": ticketPrice,
    };
  }

  factory EventModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return EventModel(
      id: document.id,
      title: data["title"],
      description: data["description"],
      eventUrl: data["eventUrl"],
      startDate: data["startDate"].toDate(),
      endDate: data["endDate"]?.toDate(),
      startTime: data["startTime"]?.toDate(),
      endTime: data["endTime"]?.toDate(),
      imageUrl: data["imageUrl"],
      location: data["location"],
      isPublic: data["isPublic"],
      isOrg: data["isOrg"],
      orgName: data["orgName"],
      isTicketed: data["isTicketed"],
      ticketPrice: data["ticketPrice"],
    );
  }
}
