import 'package:flutter/material.dart';
import 'package:flutterchat/message.dart';
import 'package:flutterchat/message_container.dart';
import 'package:flutterchat/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://176.119.157.199:8080'),
  );
  final ScrollController _scrollController = ScrollController();
  List<Widget> one = <Widget>[
    const MessageContainer(
      text: "test",
      name: "test",
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      var body = jsonDecode(message);
      Message mes = Message.fromJson(body);
      setState(() {
        one.add(MessageContainer(
          text: mes.text,
          name: mes.name,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Чатик",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "SF",
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.7,
              child: Container(
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: one.length,
                    itemBuilder: (BuildContext context, int index) {
                      return one[index];
                    }),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                children: [
                  RoundedInputField(
                    controller: _controller,
                    hintText: "Привет меня зовут Карен!",
                  ),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 27, 0, 0),
                        child: SvgPicture.asset(
                          'assets/seeeesh.svg',
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      Message mes1 = Message(_controller.text, "Аноним:");
      final json = mes1.toJson();
      String one = jsonEncode(json);
      channel.sink.add(one);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
