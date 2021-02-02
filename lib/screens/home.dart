import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Text(
        "Home",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
