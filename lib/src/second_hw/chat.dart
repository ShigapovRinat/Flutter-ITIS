import "package:json_annotation/json_annotation.dart";

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  Chat({
    required this.author,
    required this.message
  });

  String author;
  String message;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}