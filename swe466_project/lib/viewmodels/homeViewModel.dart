import 'package:flutter/cupertino.dart';
import 'package:swe466_project/enums/viewState.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/models/resoure.dart';
import 'package:swe466_project/models/task.dart';
import 'package:swe466_project/services/databaseServices.dart';

import '../locator.dart';

class HomeViewModel extends ChangeNotifier{
  final _firstoreService = locator<DatabaseServices>();
  ViewState _state = ViewState.Idle;
  List<Project> _projects;
  bool empty = true;
  List<Project> get projects => _projects;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getProjects(){
    setState(ViewState.Busy);
    _firstoreService.getProjects().listen((event) { 
      List<Project> updatedProjects = event;
      if(updatedProjects != null){
        if(updatedProjects.isNotEmpty){
          empty = false;
          _projects = updatedProjects;
        }//end if isNotEmpty
        else{
          empty = true;
        }
        //notifyListeners();
      }// end if null
    setState(ViewState.Idle);
    }, onError: (error) => print(error));
    
    // empty = false;
    // _projects = List<Project>.empty(growable: true);
    // _projects.add(Project("Project name", "description", ["goals","gol"], [Task(taskName: "name", startDate: DateTime.now(), duration: 5,
    // cost: 100.15, resoures: [Resource(name: "re", count: 2, cost: 20.5)],)]));
    // setState(ViewState.Idle);
    // ^^^^ only for testing
    
  }


}