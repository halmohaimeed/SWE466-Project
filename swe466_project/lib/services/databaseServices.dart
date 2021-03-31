import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe466_project/models/project.dart';

class DatabaseServices {


  final CollectionReference projectsCollection = FirebaseFirestore.instance.collection("projects");

  Future addProject(Project project) async{
    return await projectsCollection.doc(project.name).set(project.toMap());
  }

}