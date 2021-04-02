import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget getTextFiled(controller, labelText, width) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: width * 0.04, color: Colors.grey[700]),
    ),
  );
}

class CustomButton extends StatelessWidget {
  CustomButton(this.onPressed, this.text);
  final GestureTapCallback onPressed;
  String text;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xff152a55), fontWeight: FontWeight.bold)),
      ),
    );
  }
}
