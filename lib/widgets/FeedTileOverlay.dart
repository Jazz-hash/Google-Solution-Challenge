import 'package:bizzhome/widgets/taskTile.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Client.dart';
import 'package:bizzhome/widgets/FeedTaskTile.dart';

class FeedTileOverlay extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final String description;
  final String duration;
  final String points;

  FeedTileOverlay(
    this.title,
    this.company,
    this.date,
    this.description,
    this.duration,
    this.points,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: FeedTaskTile(
              title, company, date, description, duration, points, true),
        ),
      ],
    );
  }
}
