import 'package:flutter/material.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/models/resoure.dart';
import 'package:swe466_project/screens/sharedUI.dart';

class AddTasks extends StatefulWidget {
  Project project;
  AddTasks();
  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  DateTime _dateTime;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  List<ResourceWidget> resourceWidgets = [new ResourceWidget()];
  List<Resource> resources = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    Widget dynamicTextField = ListView(shrinkWrap: true, children: [
      ListView.builder(
        shrinkWrap: true,
        itemCount: resourceWidgets.length,
        itemBuilder: (_, index) => resourceWidgets[index],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Align(
          child: SizedBox(
            width: width * 0.4,
            child: MaterialButton(
                child: Text("Add Resource"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  setState(() {
                    resourceWidgets.add(new ResourceWidget());
                  });
                }),
          ),
        ),
      )
    ]);
    EdgeInsets edgePadding =
        EdgeInsets.fromLTRB(0, width * 0.025, 0, width * 0.025);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Project Tasks",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 34.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: edgePadding,
              child: getTextFiled(taskNameController, "Task Name", width)),
          Padding(
            padding: edgePadding,
            child: TextField(
              controller: startDateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                labelText: "Start Date",
                icon: Icon(Icons.calendar_today),
                labelStyle:
                    TextStyle(fontSize: width * 0.04, color: Colors.grey[700]),
              ),
              readOnly: true,
              onTap: () {
                setState(() {
                  _datePicker(context);
                });
              },
            ),
          ),
          getTextFiled(durationController, "Duration in Days", width),
          dynamicTextField,
          Padding(
            padding: edgePadding,
            child: CustomButton(() {}, "Add New Task"),
          ),
          Padding(padding: edgePadding, child: CustomButton(() {}, "Submit")),
        ],
      ),
    );
  }

  Future _datePicker(BuildContext context) async {
    DateTime _picker = await showDatePicker(
        context: context,
        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime(2120));
    if (_picker != null) {
      setState(() {
        print(_picker);
        _dateTime = _picker;
        startDateController.text = _dateTime.toString().split(' ').first;
      });
    }
  }
}

class ResourceWidget extends StatelessWidget {
  Resource resource;
  TextEditingController resourceName = new TextEditingController();
  TextEditingController count = new TextEditingController();
  TextEditingController cost = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
//      margin: new EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: getTextFiled(resourceName, "Resource Name", width),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: getTextFiled(count, "Count", width),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: getTextFiled(cost, "Cost ", width),
              )
            ],
          )
        ],
      ),
    );
  }
}
