// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmModel _$AlarmModelFromJson(Map<dynamic, dynamic> json) => AlarmModel(
      id: json['id'] as String,
      fromUid: json['fromUid'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      read: json['read'] as bool,
    );

Map<String, dynamic> _$AlarmModelToJson(AlarmModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromUid': instance.fromUid,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'read': instance.read,
    };
