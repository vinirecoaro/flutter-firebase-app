import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String description = "";
  bool concluded = false;
  DateTime criationDate = DateTime.now();
  DateTime changeDate = DateTime.now();
  String userId = "";

  TaskModel(
      {required this.description,
      required this.concluded,
      required this.userId});

  TaskModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    concluded = json['concluded'];
    criationDate = (json['criation_date'] as Timestamp).toDate();
    criationDate = (json['change_date'] as Timestamp).toDate();
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['concluded'] = this.concluded;
    data['criation_date'] = Timestamp.fromDate(this.criationDate);
    data['change_date'] = Timestamp.fromDate(this.criationDate);
    data['user_id'] = this.userId;
    return data;
  }
}
