import 'package:flutter/material.dart';
import 'package:swe466_project/screens/addTasks.dart';
import 'package:swe466_project/screens/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => Home());
    default:
      return MaterialPageRoute(builder: (context) => Home());
  } //end switch
}
