import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
