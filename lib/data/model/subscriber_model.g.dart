// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriberModel _$SubscriberModelFromJson(Map<String, dynamic> json) =>
    SubscriberModel(
      id: json['id'] as String,
      ref: json['ref'] as String,
      otherRef: json['otherRef'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      auth: json['auth'] as bool,
    );

Map<String, dynamic> _$SubscriberModelToJson(SubscriberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref': instance.ref,
      'otherRef': instance.otherRef,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'auth': instance.auth,
    };
