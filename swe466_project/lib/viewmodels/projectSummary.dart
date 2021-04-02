import 'package:flutter/material.dart';
import 'package:swe466_project/enums/viewState.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/services/databaseServices.dart';

import '../locator.dart';

class HomeViewModel extends ChangeNotifier {
  final _firstoreService = locator<DatabaseServices>();
  ViewState _state = ViewState.Idle;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void submitProject(Project project) {
    _firstoreService.addProject(project);
  }
}
