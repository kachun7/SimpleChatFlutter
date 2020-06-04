import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_chat/chat_store.dart';
import 'package:simple_chat/dialog_util.dart';
import 'package:simple_chat/entities.dart';

class MyApp extends StatefulWidget {
  final ChatStore chatStore;

  const MyApp({@required this.chatStore, Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _editingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _editingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(widget.chatStore.chatTitle),
        ),
        actions: <Widget>[
          Observer(
            builder: (context) => IconButton(
              icon: widget.chatStore.isLobbyOpened ? Icon(Icons.close) : Icon(Icons.settings_power),
              onPressed: () => widget.chatStore.isLobbyOpened ? widget.chatStore.close() : _showCreateLobbyDialog(context),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            Positioned.fill(
              bottom: 80,
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (_, index) => _listTile(widget.chatStore.messageEvents[index]),
                  separatorBuilder: (_, i) => const Divider(height: 8),
                  itemCount: widget.chatStore.messageEvents.length),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 80,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[100],
                child: TextField(
                  enabled: widget.chatStore.isLobbyOpened,
                  focusNode: _focusNode,
                  controller: _editingController,
                  decoration: const InputDecoration(labelText: 'Express yourself'),
                  onChanged: (_) => widget.chatStore.typing(),
                  onSubmitted: (text) {
                    widget.chatStore.sendMessage(text);
                    _editingController.text = '';
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(MessageEvent messageEvent) {
    final bool isMyMessage = messageEvent.username == widget.chatStore.lobby.username;
    final avatar = Tooltip(
      message: messageEvent.username,
      child: CircleAvatar(
        backgroundColor: isMyMessage ? const Color.fromRGBO(225, 255, 199, 1.0) : Colors.limeAccent,
        child: Icon(Icons.tag_faces),
      ),
    );

    return Row(
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        if (!isMyMessage) ...[avatar],
        Expanded(
          child: Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: isMyMessage ? Alignment.topRight : Alignment.topLeft,
            nipWidth: 8,
            nipHeight: 24,
            nip: isMyMessage ? BubbleNip.rightTop : BubbleNip.leftTop,
            color: isMyMessage ? const Color.fromRGBO(225, 255, 199, 1.0) : Colors.limeAccent,
            child: Text(messageEvent?.isTyping == true ? '...' : messageEvent.message, textAlign: TextAlign.right),
          ),
        ),
        if (isMyMessage) ...[avatar],
      ],
    );
  }

  Future<void> _showCreateLobbyDialog(BuildContext context) async {
    final diaogUtil = DialogUtil();
    final lobby = await diaogUtil.showCreateLobbyDialog(context);
    widget.chatStore.setLobby(lobby, onDone: () {
      const snackBar = SnackBar(content: Text('Lobby is closed'));
      Scaffold.of(context).showSnackBar(snackBar);
    }, onError: (dynamic error) {
      final snackBar = SnackBar(content: Text(error.toString()));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
}
