import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Task {
  String taskName;
  DateTime startDate;
  int duration;
  String resoures;
  double cost;

  Task({
    @required taskName,
    startDate,
    duration,
    resoures,
    cost,
  }) {
    this.taskName = taskName;
    this.startDate = startDate;
    this.duration = duration;
    this.resoures = resoures;
    this.cost = cost;
  }

  Map<String, dynamic> toMap() {
    return {
      "taskName": this.taskName,
      "duration": this.duration,
      "startDate": this.startDate,
      "resoures": this.resoures,
      "cost": this.cost
    };
  }

  static Task fromJson(Map<String, dynamic> map){

  }

  bool isAtSameDate(DateTime date1, DateTime date2) {
    if (date1.day == date2.day) {
      if (date1.month == date2.month) if (date1.year == date2.year) return true;
    } //end if
    return false;
  }

  

  static List<DateTime> castDates(List<dynamic> dates) {
    List<DateTime> castedDates = new List<DateTime>.empty();
    if (dates != null) {
      dates.forEach((date) {
        castedDates.add(date.toDate());
      });
    }
    return castedDates;
  }
}