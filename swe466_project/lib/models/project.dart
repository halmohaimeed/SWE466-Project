import 'package:swe466_project/models/task.dart';

class Project {
  String name;
  String description;
  List<String> goals;
  List<Task> tasks;
  double totalCost;

  Project([name, description, goals, tasks]) {
    if(name != null){
    this.name = name;
    this.description = description;
    this.goals = goals;
    this.tasks = tasks;
    this.totalCost = calcTotalCost(tasks);
    }
  } // end project()

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "description": this.description,
      "goals": this.goals,
      "tasks": tasksToMap(),
      "totalCost": this.totalCost,
    };
  }

  static Project fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }
    List<dynamic> jTasks = map["tasks"];
    List<Task> convTasks = [];

    jTasks.forEach((task) {
      convTasks.add(Task.fromJson(task));
    });
    List<String> goals = new List<String>.from(map["goals"]);
    return Project(map["name"], map["description"], goals, convTasks);
  }

  double calcTotalCost(List<Task> tasks) {
    //uses parmeter to be called before creating project obj
    double total = 0;
    for (var task in tasks) {
      total += task.cost;
    }
    return total;
  }

  List<Map<String, dynamic>> tasksToMap() {
    List<Map<String, dynamic>> tasksList = [];
    for (var task in tasks) {
      tasksList.add(task.toMap());
    } //end for in
    return tasksList;
  }
}
