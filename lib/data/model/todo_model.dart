import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.date,
    required this.title,
    required this.repeat,
    required this.user,
    required this.creator,
    required this.alarm,
    required this.description,
    required this.complete,
  });

  DateTime date;
  String title;
  List<Map<String, bool>> repeat;
  String user;
  String creator;
  bool alarm;
  String description;
  bool complete;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
