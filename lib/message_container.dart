import 'package:flutter/material.dart';

import 'text.dart';

class MessageContainer extends StatefulWidget {
  final String? text;
  final String? name;
  final String? time;
  const MessageContainer({Key? key, this.text, this.name, this.time})
      : super(key: key);

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
      child: Row(
        children: [
          TextS(
            text: widget.name,
            fontsize: 18,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(
              children: [
                TextS(
                  text: widget.text,
                  fontsize: 18,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
