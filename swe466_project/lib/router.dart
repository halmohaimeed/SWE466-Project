import 'package:flutter/material.dart';
import 'package:swe466_project/screens/addTasks.dart';
import 'package:swe466_project/screens/home.dart';
import 'package:swe466_project/screens/projectDetails.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => Home());
    case "ProjectDetails":
      var args = settings.arguments;
      return MaterialPageRoute(builder: (context) => ProjectDetails(project: args,));
    default:
      return MaterialPageRoute(builder: (context) => Home());
  } //end switch
}
