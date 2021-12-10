// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
  author: json['author'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
  'author': instance.author,
  'message': instance.message,
};