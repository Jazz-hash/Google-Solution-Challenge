import 'package:bizzhome/app.dart';
import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:bizzhome/widgets/tileOverlay.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Task.dart';

class NewsFeed extends StatelessWidget {
  _onTaskTap(BuildContext context, int taskID) {
    Navigator.pushNamed(context, TaskDetailRoute, arguments: {"id": taskID});
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

    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onTaskTypeTap(context, "In-Progress"),
                  key: Key('in_progress'),
                  child: Chip(
                    backgroundColor: Color(0xFFE5634D),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.construction, color: Colors.white),
                    ),
                    label: Text('In-Progress',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTaskTypeTap(context, "Completed"),
                  key: Key('completed'),
                  child: Chip(
                    backgroundColor: Colors.black87,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    label: Text('Completed',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) =>
                  _itemBuilder(context, tasks[index]),
            ),
          ),
        ],
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
              TileOverlay(
                task.title,
                task.assignedDate,
                task.status,
                task.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
