
import 'package:swe466_project/models/task.dart';

class Project {

  String name;
  String description;
  List<String> goals;
  List<Task> tasks;
  double totalCost;


  Project(name, description, goals, tasks){
    this.name = name;
    this.description = description;
    this.goals = goals;
    this.tasks = tasks;
    this.totalCost = calcTotalCost(tasks);
  }// end project()

  Map<String, dynamic> toMap(){
    return {
      "name": this.name,
      "description": this.description,
      "goals": this.goals,
      "tasks": tasksToMap(),
      "totalCost": this.totalCost,
    };
  }

  double calcTotalCost(List<Task> tasks){ //uses parmeter to be called before creating project obj 
    double total = 0;
    for (var task in tasks) {
      total += task.cost;
    }
    return total;
  }

  List<Map<String, dynamic>> tasksToMap(){
    List<Map<String, dynamic>> tasksList = List.empty();
    for (var task in tasks) {
      tasksList.add(task.toMap());
    }//end for in
    return tasksList;
  }
}