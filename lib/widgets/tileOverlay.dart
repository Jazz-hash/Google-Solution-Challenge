import 'package:bizzhome/widgets/taskTile.dart';
import 'package:flutter/material.dart';

class TileOverlay extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String status;
  final bool _myTask;

  TileOverlay(
      this.title, this.date, this.status, this.description, this._myTask);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: TaskTile(title, date, status, description, true, _myTask),
        ),
      ],
    );
  }
}
