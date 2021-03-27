import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
