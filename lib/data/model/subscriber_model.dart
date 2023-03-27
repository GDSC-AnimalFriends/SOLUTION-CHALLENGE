import 'package:json_annotation/json_annotation.dart';

part 'subscriber_model.g.dart';

@JsonSerializable()
class SubscriberModel {
  String id;
  String ref; //내 ref: 나의 데이터에서 구독자(상대)가 있는 위치
  String otherRef; //상대방 ref: 상대방의 데이터에서 구독자(나)가 있는 위치
  String imageUrl;
  String name;
  bool auth;

  SubscriberModel({
    required this.id,
    required this.ref,
    required this.otherRef,
    required this.imageUrl,
    required this.name,
    required this.auth,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberModelToJson(this);
}
