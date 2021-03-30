import 'package:bizzhome/models/Task.dart';
import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:bizzhome/widgets/taskTile.dart';
import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final int _taskID;
  final bool _myTask;

  TaskDetailPage(this._taskID, this._myTask);

  @override
  Widget build(BuildContext context) {
    Task task;
    print(_myTask);
    if (_myTask) {
      task = Task.fetchMyTaskByID(_taskID);
    } else {
      task = Task.fetchByID(_taskID);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 20),
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
                    height: 200,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                  child: TaskTile(
                      task.title,
                      task.client.company,
                      task.assignedDate,
                      task.status,
                      task.description,
                      false,
                      _myTask),
                ),
                task.status == "Available"
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Color(0xFFEB5757),
                            splashColor: Colors.white.withOpacity(0.5),
                            onPressed: () => {},
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star),
                                    Text(" Apply"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(""),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Icon(Icons.timelapse),
                      Padding(
                          padding: EdgeInsets.only(
                        right: 5,
                      )),
                      Text(
                        task.duration,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        right: 10,
                      )),
                      Text(" - "),
                      Padding(
                          padding: EdgeInsets.only(
                        right: 10,
                      )),
                      Icon(Icons.score),
                      Padding(
                          padding: EdgeInsets.only(
                        right: 5,
                      )),
                      _myTask
                          ? Text(
                              "+ " + task.pointsEarned,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "+ " + task.points,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    task.description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "From " + task.client.name,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              // ..addAll(textSections(location))),
            ),
          ),
        ]),
      ),
    );
  }

  // List<Widget> textSections(Location location) {
  //   return location.facts
  //       .map((fact) => TextSection(fact.title, fact.text))
  //       .toList();
  // }
}
