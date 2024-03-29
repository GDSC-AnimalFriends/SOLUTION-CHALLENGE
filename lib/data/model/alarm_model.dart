import 'package:json_annotation/json_annotation.dart';

part 'alarm_model.g.dart';

@JsonSerializable()
class AlarmModel {
  String id;
  String ref;
  String toUid;
  String fromUid;
  String name;
  String imageUrl;
  bool read;

  AlarmModel({
    required this.id,
    required this.ref,
    required this.toUid,
    required this.fromUid,
    required this.name,
    required this.imageUrl,
    required this.read,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmModelToJson(this);
}
