import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  const TextFieldContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.05,
      margin: EdgeInsets.fromLTRB(15, 27, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
