import 'package:json_annotation/json_annotation.dart';
import 'package:solution_challenge/data/model/todo_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String name;
  String phone;
  String email;
  bool type; //false : 보호자, true : 노인
  List<TodoModel>? todoList;

  UserModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
