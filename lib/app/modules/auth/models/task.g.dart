// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      startTime: json['startTime'] as String?,
      category: json['category'] as String?,
      workSessions: (json['workSessions'] as num?)?.toInt() ?? 0,
      longBreaks: (json['longBreaks'] as num?)?.toInt() ?? 0,
      shortBreaks: (json['shortBreaks'] as num?)?.toInt() ?? 0,
      userId: json['userId'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      sessionTime: (json['sessionTime'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'startTime': instance.startTime,
      'category': instance.category,
      'userId': instance.userId,
      'workSessions': instance.workSessions,
      'longBreaks': instance.longBreaks,
      'shortBreaks': instance.shortBreaks,
      'sessionTime': instance.sessionTime,
      'isCompleted': instance.isCompleted,
    };
