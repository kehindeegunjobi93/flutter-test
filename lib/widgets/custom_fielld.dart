import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  final String labelText;
  final bool obscure;
  final keyboardType;
  final Color cursorColor, color, focusedColor, enabledColor, labelColor;
  final validator;
  final controller;
  final initialValue;

  const CustomField({Key key, @required this.labelText,
    this.obscure = false,
    this.keyboardType,
    this.cursorColor,
    this.color = Colors.black,
    this.focusedColor = Colors.grey,
    this.enabledColor = Colors.grey,
    this.labelColor = Colors.black,
    this.validator,
    this.controller, this.initialValue,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscure,
      cursorColor: cursorColor,
      style: TextStyle(color: color),
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusedColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: enabledColor)),
          labelText: labelText,
          labelStyle: TextStyle(
//              fontWeight: FontWeight.bold,
              color: labelColor,
              fontSize: 14
          )
      ),
    );
  }
}
