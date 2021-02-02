import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Text(
        "Notifications",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
