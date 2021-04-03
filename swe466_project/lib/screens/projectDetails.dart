import 'package:flutter/material.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/services/databaseServices.dart';

import '../locator.dart';

class ProjectDetails extends StatefulWidget {
  final Project project;
  const ProjectDetails({Key key, this.project}) : super(key: key);
  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  double totalCost;
  @override
  Widget build(BuildContext context) {
    totalCost = widget.project.totalCost;
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Details"),
      ),
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.06, height * 0.02, width * 0.06, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.05),
              width: width * 0.9,
              height: height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      offset: Offset.fromDirection(60, 2),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.name,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.024,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.black54,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    widget.project.description,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.black54,
                      ),
                      Text(
                        "Total Cost:",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "${totalCost}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.emoji_events_outlined,
                        color: Colors.black54,
                      ),
                      Text(
                        "Goals",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.project.goals.length,
                        itemBuilder: (context, index) {
                          var goal = widget.project.goals[index];
                          return Card(
                            color: Colors.lightBlue,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Text(
                                goal,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.025, horizontal: width * 0.01),
              child: Text(
                "Tasks",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: widget.project.tasks.length,
                  itemBuilder: (context, index) {
                    var task = widget.project.tasks[index];
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.008),
                        child: ListTile(
                          title: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.009),
                            child: Text(
                              task.taskName,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Cost",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${task.cost}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Duration",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${task.duration}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Start Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${task.startDate.day}/${task.startDate.month}/${task.startDate.year}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await _showMyDialog(context, index);
                              }),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you really want to delete this task?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                setState(() {
                  widget.project.tasks.removeAt(index);
                  widget.project.totalCost =
                      widget.project.calcTotalCost(widget.project.tasks);
                  totalCost =
                      widget.project.calcTotalCost(widget.project.tasks);
                });

                await locator<DatabaseServices>().deleteTask(widget.project);
                build(context);
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
