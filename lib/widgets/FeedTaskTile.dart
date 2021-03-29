import 'package:bizzhome/styles.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Client.dart';

const TaskTileHeight = 200.0;

class FeedTaskTile extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String duration;
  final String points;
  final bool darkTheme;

  FeedTaskTile(this.title, this.date, this.description, this.duration,
      this.points, this.darkTheme);

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: TaskTileHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.title.copyWith(color: textColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Client Name: XXXXX ",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: textColor),
                ),
                Text(
                  "Starting Date: " + date.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: textColor),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Duration: " + duration.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: textColor),
                ),
                Text(
                  "Points: " + points.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: textColor),
                ),
              ],
            ),
          ]),
    );
  }
}
