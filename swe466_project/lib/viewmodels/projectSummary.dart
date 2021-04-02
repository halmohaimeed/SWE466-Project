import 'package:flutter/material.dart';
import 'package:swe466_project/enums/viewState.dart';
import 'package:swe466_project/models/project.dart';
import 'package:swe466_project/services/databaseServices.dart';

import '../locator.dart';

class ProjectSummaryViewModel extends ChangeNotifier {
  final _firstoreService = locator<DatabaseServices>();
  ViewState _state = ViewState.Idle;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<void> submitProject(Project project) async {
    setState(ViewState.Busy);
    await _firstoreService.addProject(project);
    setState(ViewState.Idle);
  }
}
