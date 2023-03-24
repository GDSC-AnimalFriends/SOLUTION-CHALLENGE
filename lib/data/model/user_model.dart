import 'package:json_annotation/json_annotation.dart';
import 'package:solution_challenge/data/model/todo_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String name;
  String phone;
  String email;
  String? imageUrl;
  String? type;
  List<TodoModel>? todoList;
  List<String>? subscribeList;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.imageUrl,
    this.type,
    this.todoList,
    this.subscribeList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
