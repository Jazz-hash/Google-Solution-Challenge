import 'package:bizzhome/app.dart';
import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:bizzhome/widgets/FeedTileOverlay.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Task.dart';

class FeedPage extends StatelessWidget {
  _onTaskTap(BuildContext context, int taskID) {
    Navigator.pushNamed(context, TaskDetailRoute,
        arguments: {"id": taskID, "myTask": false});
  }

  _onTaskTypeTap(BuildContext context, String type) {
    final tasks = Task.fetchInProgress(type);
    for (var i = 0; i < tasks.length; i++) {
      debugPrint(tasks[i].title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Task.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) =>
                      _itemBuilder(context, tasks[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, task) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => _onTaskTap(context, task.id),
        key: Key('task_list_item_${task.id}'),
        child: Container(
          height: 245.0,
          child: Stack(
            children: [
              ImageBanner(assetPath: task.imagePath),
              FeedTileOverlay(
                task.title,
                task.client.name,
                task.client.company,
                task.assignedDate,
                task.description,
                task.duration,
                task.points,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
