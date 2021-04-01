import 'package:flutter/cupertino.dart';
import 'package:swe466_project/models/resoure.dart';

class Task {
  String taskName;
  DateTime startDate;
  int duration;
  List<Resource> resoures;
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
      "resoures": resourcesToMapArray(),
      "cost": this.cost
    };
  }

  List<Map<String, dynamic>> resourcesToMapArray() {
    List<Map<String, dynamic>> mapfiedResoucres = [];
    this.resoures.forEach((element) {
      mapfiedResoucres.add(element.toMap());
    });
    return mapfiedResoucres;
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

  static Task fromJson(Map<String, dynamic> map) {
    List<dynamic> resourceList = map['resoures'];
    List<Resource> resoures = [];
    resourceList.forEach((element) {
      var task = Resource.fromJson(element);
      resoures.add(task);
    });

    return Task(
      taskName: map['taskName'],
      startDate: map['startDate'],
      duration: map['duration'],
      resoures: resoures,
      cost: map['cost'],
    );
  }
}
