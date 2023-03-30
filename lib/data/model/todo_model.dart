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

  String todoid;
  DateTime date;
  String title;
  String user;
  String creator;
  String description;
  bool complete;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
