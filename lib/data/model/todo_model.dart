import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.todoid,
    required this.date,
    required this.alarmDate,
    required this.title,
    required this.dayRepeat,
    required this.weekRepeat,
    required this.repeat,
    required this.user,
    required this.creator,
    required this.alarm,
    required this.description,
    required this.complete,
  });

  String todoid;
  DateTime date;
  DateTime alarmDate;
  String title;
  int dayRepeat;
  int weekRepeat;
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
