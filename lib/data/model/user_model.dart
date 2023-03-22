import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String name;
  String phone;
  String email;
  String password;
  bool type; //false : 보호자, true : 노인

  UserModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
