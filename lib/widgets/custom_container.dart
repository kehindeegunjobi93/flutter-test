import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:madesoftlogic/constants.dart';

class CustomContainer extends StatefulWidget {
  final String text;
  final bool onOrOff;

  CustomContainer({this.text, this.onOrOff});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: MediaQuery.of(context).size.width * 0.99,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 14.0,
                spreadRadius: 11.0,
                offset: Offset(4, 7)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.text, style: TextStyle(color: Colors.grey, fontSize: 18),),
          FlutterSwitch(
            activeColor: primaryColor,
            width: 90.0,
            height: 30.0,
            valueFontSize: 16.0,
            toggleSize: 40.0,
            value: widget.onOrOff,
            borderRadius: 30.0,
            padding: 8.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
