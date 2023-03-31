import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.todoid,
    required this.date,
    required this.title,
    required this.user,
    required this.creator,
    required this.description,
    required this.complete,
  });

  late String todoid;
  late DateTime date;
  late String title;
  late String user;
  late String creator;
  late String description;
  late bool complete;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  TodoModel.fromDb(DataSnapshot data) {
    var dataMap = data.value as Map?;
    todoid = dataMap!['todoid'];
    date = dataMap['date'];
    title = dataMap['title'];
    user = dataMap['user'];
    creator = dataMap['creator'];
    description = dataMap['description'];
    complete = dataMap['complete'];
  }
}
