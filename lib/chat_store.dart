import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_chat/entities.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  WebSocket _webSocket;
  VoidCallback onDone;
  void Function(dynamic) onError;

  @observable
  Lobby lobby;

  @observable
  ObservableList<MessageEvent> messageEvents = ObservableList<MessageEvent>();

  @computed
  String get chatTitle => lobby?.channel != null ? 'Lobby: #${lobby.channel}' : 'Chat';

  @computed
  bool get isLobbyOpened => lobby != null;

  @action
  void setLobby(Lobby lobby, {VoidCallback onDone, void Function(dynamic) onError}) {
    this.lobby = lobby;
    this.onDone = onDone;
    this.onError = onError;
    _connect();
  }

  @action
  Future<void> close() async {
    if (_webSocket != null) {
      _webSocket.close();
      _webSocket = null;
    }
    messageEvents.clear();
    lobby = null;
  }

  @action
  void sendMessage(String message) {
    if (_webSocket == null) return;
    if (lobby?.username == null) return;
    if (message.isEmpty) return;

    final messageEvent = MessageEvent(username: lobby.username, message: message);
    _webSocket.add(messageEvent.toJsonString());
    messageEvents.add(messageEvent);
  }

  @action
  void typing() {
    final messageEvent = MessageEvent(username: lobby.username, isTyping: true);
    _webSocket.add(messageEvent.toJsonString());
  }

  Future<void> _connect() async {
    if (_webSocket != null || lobby?.channel == null) return;

    final url = 'wss://connect.websocket.in/v3/${lobby.channel}?apiKey=fFstH9wV7HjxZcrIIblG6YXHjeHJ7NVaoCJZPpI5RQSiJ71M2u8Iu6Tlsnad';
    _webSocket = await WebSocket.connect(url);
    _webSocket.listen(_onData, onError: onError, onDone: _onDone);
  }

  void _onData(dynamic data) {
    if (data is String) {
      final content = json.decode(data) as Map<String, dynamic>;
      final messageEvent = MessageEvent.fromJson(content);
      messageEvents.removeWhere((message) => messageEvent.username == lobby.username && message.isTyping == true);
      messageEvents.add(messageEvent);
    }
  }

  void _onDone() {
    close();
    onDone();
  }
}
