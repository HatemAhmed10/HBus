import 'package:cloud_firestore/cloud_firestore.dart';

class TravelModel {
  String? id;
  String? country;
  String? Time;
  String? salary;
  Timestamp? date;
  String? usersnumber;
  List? userBus;

  TravelModel({
    this.id,
    this.country,
    this.Time,
    this.salary,
    this.date,
    this.usersnumber,
    this.userBus,
  });
  TravelModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    country = json["country"];
    Time = json["Time"];
    salary = json["salary"];
    date = json["date"];
    usersnumber = json["usersnumber"];
    userBus = json["userBus"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'Time': Time,
      'salary': salary,
      'date': date,
      'usersnumber': usersnumber,
      'userBus': userBus,
    };
  }
}
