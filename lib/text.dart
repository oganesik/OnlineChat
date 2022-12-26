import 'package:flutter/material.dart';

class TextS extends StatefulWidget {
  final String? text;
  final Color? color;
  final double? fontsize;
  const TextS({Key? key, this.text, this.color, this.fontsize})
      : super(key: key);

  @override
  State<TextS> createState() => _TextSState();
}

class _TextSState extends State<TextS> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: TextStyle(
        fontFamily: "SF",
        color: widget.color,
        fontSize: widget.fontsize,
      ),
    );
  }
}
