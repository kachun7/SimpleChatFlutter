import 'package:flutter/material.dart';
import 'package:simple_chat/app.dart';
import 'package:simple_chat/chat_store.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApp(chatStore: ChatStore()),
    );
  }
}
