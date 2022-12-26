import 'package:flutter/material.dart';

import 'textField_container.dart';

class RoundedInputField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please write a message';
          } else if (value.length >= 30) {
            return 'Please write your message in less than 30 characters';
          }
          return null;
        },
        maxLength: 30,
        onChanged: (value) {},
        decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            hintText: widget.hintText,
            border: InputBorder.none,
            counterText: ""),
      ),
    );
  }
}
