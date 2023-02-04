import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

//예시 모델입니다. https://changjoopark.medium.com/flutter%EC%97%90%EC%84%9C-json-%EC%9D%91%EB%8B%B5%EC%9D%84-%EB%8B%A4%EB%A3%A8%EB%8A%94-%EB%B0%A9%EB%B2%95-df17ac6a3a3d 참고 해주세요
@JsonSerializable()
class LoginModel {
  String id;
  String password;

  LoginModel({required this.id, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
