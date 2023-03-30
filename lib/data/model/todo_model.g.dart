// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      todoid: json['todoid'] as String,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      user: json['user'] as String,
      creator: json['creator'] as String,
      description: json['description'] as String,
      complete: json['complete'] as bool,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'todoid': instance.todoid,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'user': instance.user,
      'creator': instance.creator,
      'description': instance.description,
      'complete': instance.complete,
    };
