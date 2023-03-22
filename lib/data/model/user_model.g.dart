// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      type: json['type'] as bool,
    )..todoList = (json['todoList'] as List<dynamic>?)
        ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'type': instance.type,
      'todoList': instance.todoList,
    };
