// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageEvent _$_$_MessageEventFromJson(Map<String, dynamic> json) {
  return _$_MessageEvent(
    username: json['username'] as String,
    message: json['message'] as String,
    isTyping: json['isTyping'] as bool,
  );
}

Map<String, dynamic> _$_$_MessageEventToJson(_$_MessageEvent instance) =>
    <String, dynamic>{
      'username': instance.username,
      'message': instance.message,
      'isTyping': instance.isTyping,
    };
