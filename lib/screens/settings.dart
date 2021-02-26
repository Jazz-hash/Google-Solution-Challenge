import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
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
