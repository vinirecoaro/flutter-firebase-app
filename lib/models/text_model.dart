import 'package:cloud_firestore/cloud_firestore.dart';

class TextModel {
  DateTime dateHour = DateTime.now();
  String text = "";
  String userId = "";
  String nickname = "";

  TextModel({required this.text, required this.userId, required this.nickname});

  TextModel.fromJson(Map<String, dynamic> json) {
    dateHour = (json['date_hour'] as Timestamp).toDate();
    text = json['text'];
    userId = json['user_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_hour'] = Timestamp.fromDate(dateHour);
    data['text'] = text;
    data['user_id'] = userId;
    data['nickname'] = nickname;
    return data;
  }
}
