import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:bizzhome/widgets/tileOverlay.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Task.dart';

class NewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Task.fetchAll();

    return Container(
      margin: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => _itemBuilder(context, tasks[index]),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, task) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 245.0,
          child: Stack(
            children: [
              ImageBanner(assetPath: "assets/images/background.jpg"),
              TileOverlay(task.title, task.date, task.description),
            ],
          ),
        ),
      ),
    );
  }
}
