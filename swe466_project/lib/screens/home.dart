import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swe466_project/enums/viewState.dart';
import 'package:swe466_project/viewmodels/homeViewModel.dart';
import 'package:swe466_project/models/project.dart';

import '../locator.dart';

class Home extends StatelessWidget {
  var width;
  var height;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    height = screenSize.height;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.getProjects(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Home"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, "CreateProject");
          },
          label: const Text("Add Project"),
          icon: const Icon(Icons.add),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(width * 0.06, height * 0.07, width * 0.06, 0.0),
            child: Column(
              children: [
                Flexible(
                    child: (model.state == ViewState.Busy)
                        ? Center(
                            //if model busy
                            child: CircularProgressIndicator(),
                          )
                        : (model.empty)
                            ? //model idel
                            Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "There Is No Projects To Display",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: width * 0.06,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: model.projects.length,
                                itemBuilder: (context, index) {
                                  Project project = model.projects[index];
                                  return Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(width * 0.008),
                                        child: ListTile(
                                          title: Text(
                                            project.name,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black87,
                                            ),
                                          ),

                                          subtitle: Text("Total Cost: ${project.totalCost}"),

                                          trailing: IconButton(
                                            icon: Icon(Icons.info_outlined),
                                            color: Colors.grey,
                                            onPressed: (){
                                              Navigator.pushNamed(context, "ProjectDetails", arguments: project);
                                            },
                                          ),

                                        ),
                                      ),
                                  );
                                })),
              ],
            )),
      ),
    );
  }
}
