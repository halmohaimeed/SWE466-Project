import 'package:flutter/material.dart';
import 'package:swe466_project/screens/addTasks.dart';
import 'package:swe466_project/screens/createProject.dart';
import 'package:swe466_project/screens/home.dart';
import 'package:swe466_project/screens/projectDetails.dart';
import 'package:swe466_project/screens/projectSummary.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => Home());
    case "ProjectDetails":
      var args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ProjectDetails(
          project: args,
        ),
      );
    case "AddTasks":
      var project = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => AddTasks(project: project),
      );
    case "ProjectSummary":
      var project = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ProjectSummary(
          project: project,
        ),
      );
    case "CreateProject":
      return MaterialPageRoute(builder: (context) => CreateProject());
    default:
      return MaterialPageRoute(builder: (context) => Home());
  } //end switch
}
