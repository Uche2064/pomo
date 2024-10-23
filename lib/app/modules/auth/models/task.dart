import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String? id, title, date, startTime, category, userId;
  int? workSessions, longBreaks, shortBreaks, sessionTime;
  bool? isCompleted;

  Task({
    this.id,
    this.title,
    this.date,
    this.startTime,
    this.category,
    this.workSessions = 0,
    this.longBreaks = 0,
    this.shortBreaks = 0,
    this.userId,
    this.isCompleted = false,
    this.sessionTime = 10,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Task.fromJson(data);
  }
}
