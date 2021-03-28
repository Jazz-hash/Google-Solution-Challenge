import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
        child: Text(_firebaseAuth.currentUser.uid),
      ),
    );
  }
}
