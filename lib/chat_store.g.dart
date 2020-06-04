// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  Computed<String> _$chatTitleComputed;

  @override
  String get chatTitle => (_$chatTitleComputed ??=
          Computed<String>(() => super.chatTitle, name: '_ChatStore.chatTitle'))
      .value;
  Computed<bool> _$isLobbyOpenedComputed;

  @override
  bool get isLobbyOpened =>
      (_$isLobbyOpenedComputed ??= Computed<bool>(() => super.isLobbyOpened,
              name: '_ChatStore.isLobbyOpened'))
          .value;

  final _$lobbyAtom = Atom(name: '_ChatStore.lobby');

  @override
  Lobby get lobby {
    _$lobbyAtom.reportRead();
    return super.lobby;
  }

  @override
  set lobby(Lobby value) {
    _$lobbyAtom.reportWrite(value, super.lobby, () {
      super.lobby = value;
    });
  }

  final _$messageEventsAtom = Atom(name: '_ChatStore.messageEvents');

  @override
  ObservableList<MessageEvent> get messageEvents {
    _$messageEventsAtom.reportRead();
    return super.messageEvents;
  }

  @override
  set messageEvents(ObservableList<MessageEvent> value) {
    _$messageEventsAtom.reportWrite(value, super.messageEvents, () {
      super.messageEvents = value;
    });
  }

  final _$closeAsyncAction = AsyncAction('_ChatStore.close');

  @override
  Future<void> close() {
    return _$closeAsyncAction.run(() => super.close());
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void setLobby(Lobby lobby,
      {VoidCallback onDone, void Function(dynamic) onError}) {
    final _$actionInfo =
        _$_ChatStoreActionController.startAction(name: '_ChatStore.setLobby');
    try {
      return super.setLobby(lobby, onDone: onDone, onError: onError);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage(String message) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.sendMessage');
    try {
      return super.sendMessage(message);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void typing() {
    final _$actionInfo =
        _$_ChatStoreActionController.startAction(name: '_ChatStore.typing');
    try {
      return super.typing();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lobby: ${lobby},
messageEvents: ${messageEvents},
chatTitle: ${chatTitle},
isLobbyOpened: ${isLobbyOpened}
    ''';
  }
}
