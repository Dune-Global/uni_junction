import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String userId;
  String title;
  String description;
  String? eventUrl;
  DateTime startDate;
  DateTime? endDate;
  DateTime? startTime;
  DateTime? endTime;
  String imageUrl;
  String location;
  bool? isPrivate;
  bool? isOrg;
  String? orgName;
  bool? isTicketed;
  String? ticketPrice;
  String? headCount;
  String? eventCategory;
  bool? isOnline;
  List<String>? attendees;
  String? university;

  EventModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      this.eventUrl,
      required this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      required this.imageUrl,
      required this.location,
      this.isPrivate,
      this.isOrg,
      this.orgName,
      this.isTicketed,
      this.ticketPrice,
      this.headCount,
      this.eventCategory,
      this.attendees,
      this.isOnline,
      this.university
      });

  // Static function to create empty event model
  static EventModel empty() => EventModel(
        id: "",
        userId: "",
        title: "",
        description: "",
        startDate: DateTime.now(),
        imageUrl: "",
        location: "",
        attendees: List.empty(),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "userId": userId,
      "description": description,
      "eventUrl": eventUrl,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime,
      "imageUrl": imageUrl,
      "location": location,
      "isPublic": isPrivate,
      "isOrg": isOrg,
      "orgName": orgName,
      "isTicketed": isTicketed,
      "ticketPrice": ticketPrice,
      "headCount": headCount,
      "eventCategory": eventCategory,
      "isOnline": isOnline,
      "attendees": attendees,
      "university": university 
    };
  }

  factory EventModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return EventModel(
      id: document.id,
      userId: data["userId"] ?? '',
      title: data["title"] ?? '',
      description: data["description"] ?? '',
      eventUrl: data["eventUrl"] ?? '',
      startDate: data["startDate"].toDate(),
      endDate: data["endDate"]?.toDate(),
      startTime: data["startTime"]?.toDate(),
      endTime: data["endTime"]?.toDate(),
      imageUrl: data["imageUrl"] ?? '',
      location: data["location"] ?? '',
      isPrivate: data["isPrivate"],
      isOrg: data["isOrg"],
      orgName: data["orgName"] ?? '',
      isTicketed: data["isTicketed"],
      ticketPrice: data["ticketPrice"],
      attendees: List<String>.from(data["attendees"] ?? []),
      eventCategory: data["eventCategory"] ?? '',
      headCount: data["headCount"],
      isOnline: data["isOnline"],
      university: data["university"] ?? ''
    );
  }
}
