import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe466_project/models/project.dart';

class DatabaseServices {
  final CollectionReference projectsCollection =
      FirebaseFirestore.instance.collection("projects");

  Future addProject(Project project) async {
    return await projectsCollection.doc(project.name).set(project.toMap());
  }

  Stream getProjects() {
    StreamController<List<Project>> _projectController =
        StreamController<List<Project>>.broadcast();
    projectsCollection.snapshots().listen((projectsSnapshot) {
      if (projectsSnapshot.docs.isNotEmpty) {
        var projects = projectsSnapshot.docs
            .map((e) => Project.fromJson(e.data()))
            .toList();
        _projectController.add(projects);
      } else {
        _projectController.add(List<Project>.empty());
      }

    });

    return  _projectController.stream;

  }
}
