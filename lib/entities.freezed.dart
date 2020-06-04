// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MessageEvent _$MessageEventFromJson(Map<String, dynamic> json) {
  return _MessageEvent.fromJson(json);
}

class _$MessageEventTearOff {
  const _$MessageEventTearOff();

  _MessageEvent call(
      {@required String username, String message, bool isTyping}) {
    return _MessageEvent(
      username: username,
      message: message,
      isTyping: isTyping,
    );
  }
}

// ignore: unused_element
const $MessageEvent = _$MessageEventTearOff();

mixin _$MessageEvent {
  String get username;
  String get message;
  bool get isTyping;

  Map<String, dynamic> toJson();
  $MessageEventCopyWith<MessageEvent> get copyWith;
}

abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res>;
  $Res call({String username, String message, bool isTyping});
}

class _$MessageEventCopyWithImpl<$Res> implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(this._value, this._then);

  final MessageEvent _value;
  // ignore: unused_field
  final $Res Function(MessageEvent) _then;

  @override
  $Res call({
    Object username = freezed,
    Object message = freezed,
    Object isTyping = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
      message: message == freezed ? _value.message : message as String,
      isTyping: isTyping == freezed ? _value.isTyping : isTyping as bool,
    ));
  }
}

abstract class _$MessageEventCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$MessageEventCopyWith(
          _MessageEvent value, $Res Function(_MessageEvent) then) =
      __$MessageEventCopyWithImpl<$Res>;
  @override
  $Res call({String username, String message, bool isTyping});
}

class __$MessageEventCopyWithImpl<$Res> extends _$MessageEventCopyWithImpl<$Res>
    implements _$MessageEventCopyWith<$Res> {
  __$MessageEventCopyWithImpl(
      _MessageEvent _value, $Res Function(_MessageEvent) _then)
      : super(_value, (v) => _then(v as _MessageEvent));

  @override
  _MessageEvent get _value => super._value as _MessageEvent;

  @override
  $Res call({
    Object username = freezed,
    Object message = freezed,
    Object isTyping = freezed,
  }) {
    return _then(_MessageEvent(
      username: username == freezed ? _value.username : username as String,
      message: message == freezed ? _value.message : message as String,
      isTyping: isTyping == freezed ? _value.isTyping : isTyping as bool,
    ));
  }
}

@JsonSerializable()
class _$_MessageEvent implements _MessageEvent {
  _$_MessageEvent({@required this.username, this.message, this.isTyping})
      : assert(username != null);

  factory _$_MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageEventFromJson(json);

  @override
  final String username;
  @override
  final String message;
  @override
  final bool isTyping;

  @override
  String toString() {
    return 'MessageEvent(username: $username, message: $message, isTyping: $isTyping)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageEvent &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.isTyping, isTyping) ||
                const DeepCollectionEquality()
                    .equals(other.isTyping, isTyping)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(isTyping);

  @override
  _$MessageEventCopyWith<_MessageEvent> get copyWith =>
      __$MessageEventCopyWithImpl<_MessageEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageEventToJson(this);
  }
}

abstract class _MessageEvent implements MessageEvent {
  factory _MessageEvent(
      {@required String username,
      String message,
      bool isTyping}) = _$_MessageEvent;

  factory _MessageEvent.fromJson(Map<String, dynamic> json) =
      _$_MessageEvent.fromJson;

  @override
  String get username;
  @override
  String get message;
  @override
  bool get isTyping;
  @override
  _$MessageEventCopyWith<_MessageEvent> get copyWith;
}
