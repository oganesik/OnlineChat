import 'package:flutter/material.dart';
import 'package:flutterchat/home_page.dart';

void main() {
  runApp(const OnlineChat());
}

class OnlineChat extends StatefulWidget {
  const OnlineChat({Key? key}) : super(key: key);

  @override
  State<OnlineChat> createState() => _OnlineChatState();
}

class _OnlineChatState extends State<OnlineChat> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "OnlineChat",
      home: HomePage(),
    );
  }
}
