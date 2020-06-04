import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.g.dart';
part 'entities.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  factory MessageEvent({@required String username, String message, bool isTyping}) = _MessageEvent;

  @JsonSerializable(createToJson: true)
  factory MessageEvent.fromJson(Map<String, dynamic> json) => _$MessageEventFromJson(json);
}

extension ExtendedMessageEvent on MessageEvent {
  String toJsonString() => '{"username":"$username", "message":"$message", "isTyping":$isTyping}';
}

class Lobby {
  final int channel;
  final String username;

  Lobby({@required this.channel, @required this.username});
}
