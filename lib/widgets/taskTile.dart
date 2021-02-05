import 'package:bizzhome/styles.dart';
import 'package:flutter/material.dart';

const TaskTileHeight = 100.0;

class TaskTile extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final bool darkTheme;

  TaskTile(this.title, this.date, this.description, this.darkTheme);

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
            Text(
              date.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle,
            ),
            Text(
              description.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: textColor),
            ),
          ]),
    );
  }
}
