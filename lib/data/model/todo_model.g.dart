// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      todoid: json['todoid'] as String,
      date: DateTime.parse(json['date'] as String),
      alarmDate: DateTime.parse(json['alarmDate'] as String),
      title: json['title'] as String,
      dayRepeat: json['dayRepeat'] as bool,
      weekRepeat: json['weekRepeat'] as bool,
      repeat: (json['repeat'] as List<dynamic>)
          .map((e) => Map<String, bool>.from(e as Map))
          .toList(),
      user: json['user'] as String,
      creator: json['creator'] as String,
      alarm: json['alarm'] as bool,
      description: json['description'] as String,
      complete: json['complete'] as bool,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'todoid': instance.todoid,
      'date': instance.date.toIso8601String(),
      'alarmDate': instance.alarmDate.toIso8601String(),
      'title': instance.title,
      'dayRepeat': instance.dayRepeat,
      'weekRepeat': instance.weekRepeat,
      'repeat': instance.repeat,
      'user': instance.user,
      'creator': instance.creator,
      'alarm': instance.alarm,
      'description': instance.description,
      'complete': instance.complete,
    };