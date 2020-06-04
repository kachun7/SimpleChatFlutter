import 'package:flutter/material.dart';
import 'package:simple_chat/entities.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class DialogUtil {
  final TextEditingController _editingController = TextEditingController();
  int _channel = 1;
  bool isUsernameEmpty = true;

  Future<Lobby> showCreateLobbyDialog(BuildContext context) {
    return showDialog<Lobby>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Join Lobby'),
        content: Container(
          height: 110,
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _editingController,
                decoration: const InputDecoration(labelText: 'Username'),
                onChanged: (text) => isUsernameEmpty = text.isEmpty,
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Text(
                    'Lobby',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.blue),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    child: StepperSwipe(
                      initialValue: 1,
                      onChanged: (value) => _channel = value,
                      dragButtonColor: Theme.of(context).accentColor,
                      withPlusMinus: true,
                      iconsColor: Theme.of(context).accentColor,
                      withNaturalNumbers: true,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => isUsernameEmpty ? null : Navigator.pop(context, Lobby(channel: _channel, username: _editingController.text)),
            child: const Text('Join'),
          )
        ],
      ),
    );
  }

  void dispose() {
    _editingController.dispose();
  }
}
