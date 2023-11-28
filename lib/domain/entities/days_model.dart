import 'package:flutter/material.dart';

class DaysModel {
  String? day;
  List<TimeSchedule>? timeSchedule;
  DaysModel({this.day, this.timeSchedule});

  DaysModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['TimeSchudlue'] != null) {
      timeSchedule = <TimeSchedule>[];
      json['TimeSchudlue'].forEach((v) {
        timeSchedule!.add(TimeSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    if (timeSchedule != null) {
      data['TimeSchudlue'] = timeSchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSchedule {
  TimeOfDay? from;
  TimeOfDay? to;

  TimeSchedule({this.from, this.to});

  TimeSchedule.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
