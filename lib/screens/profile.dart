import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
