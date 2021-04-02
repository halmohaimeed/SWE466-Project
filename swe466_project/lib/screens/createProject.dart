import 'package:flutter/material.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/screens/sharedUI.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  List<String> goalsList = List<String>.empty(growable: true);
  List<Widget> goalsWidgets = List<Widget>.empty(growable: true);
  Project project = Project();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create New Project"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          project.name = nameController.text;
          project.description = descriptionController.text;
          project.goals = goalsList;
          Navigator.pushNamed(context, "AddTasks", arguments: project);
        },
        label: Text("All Set, Let's Add Some Tasks"),
        icon: Icon(Icons.arrow_forward_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding:
            EdgeInsets.fromLTRB(width * 0.06, height * 0.07, width * 0.06, 0.0),
        height: height * 0.90,
        width: width * 0.90,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.01),
              child: getTextFiled(nameController, "Project Name", width),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.01),
              child: getTextFiled(
                  descriptionController, "Project Description", width),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: width * 0.6,
                      child: getTextFiled(goalController, "Goal", width)),
                  IconButton(
                      icon: Icon(Icons.add_circle_outline_rounded),
                      color: Colors.green,
                      onPressed: () {
                        _onAddGoal();
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.015, horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.emoji_events_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    "Goals",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: goalsWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bulidGoals();
  }

  _onAddGoal() {
    setState(() {
      goalsList.add(goalController.text);
      goalController.clear();
      bulidGoals();
    });
  } //end _onAddGoal()

  _removeLabelAt(int index) {
    setState(() {
      goalsList.removeAt(index);
      bulidGoals();
    });
  } //end _removeLabelAt()

  void bulidGoals() {
    print("${goalsList.length}");
    goalsWidgets = [];
    for (int i = 0; i < goalsList.length; i++) {
      goalsWidgets.add(Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          title: Text(goalsList[i]),
          trailing: IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.red[800],
              ),
              onPressed: () {
                _removeLabelAt(i);
              }),
        ),
      ));
    } //end for
  } //end bulidGoals()

}
