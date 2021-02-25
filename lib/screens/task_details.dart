import 'package:bizzhome/models/Task.dart';
import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:bizzhome/widgets/taskTile.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  final int _taskID;

  TaskDetail(this._taskID);

  @override
  Widget build(BuildContext context) {
    final task = Task.fetchByID(_taskID);
    debugPrint(task.title);

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ImageBanner(assetPath: task.imagePath),
            Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: Image.asset(
                task.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
              child: TaskTile(task.title, task.assignedDate, task.status,
                  task.description, true),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                task.description,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          // ..addAll(textSections(location))),
        ),
      ),
    );
  }

  // List<Widget> textSections(Location location) {
  //   return location.facts
  //       .map((fact) => TextSection(fact.title, fact.text))
  //       .toList();
  // }
}
