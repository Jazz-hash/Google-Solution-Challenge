import 'package:bizzhome/styles.dart';
import 'package:flutter/material.dart';

const TaskTileHeight = 100.0;

class TaskTile extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String description;
  final bool darkTheme;

  TaskTile(
      this.title, this.date, this.status, this.description, this.darkTheme);

  bool checkTaskStatus(String status) {
    if (status == "Completed") {
      return true;
    } else {
      return false;
    }
  }

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
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: textColor),
            ),
            checkTaskStatus(status)
                ? Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          status.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: textColor),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.construction,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          status.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: textColor),
                        ),
                      ),
                    ],
                  ),
          ]),
    );
  }
}
