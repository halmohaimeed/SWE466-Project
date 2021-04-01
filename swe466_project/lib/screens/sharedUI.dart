import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget getTextFiled(controller, labelText, width) {
  TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: width * 0.04, color: Colors.grey[700]),
    ),
  );
}
