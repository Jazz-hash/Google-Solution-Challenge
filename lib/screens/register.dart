import 'package:flutter/material.dart';
import 'package:bizzhome/widgets/buttonNewUser.dart';
import 'package:bizzhome/widgets/newEmail.dart';
import 'package:bizzhome/widgets/newName.dart';
import 'package:bizzhome/widgets/password.dart';
import 'package:bizzhome/widgets/signup.dart';
import 'package:bizzhome/widgets/textNew.dart';
import 'package:bizzhome/widgets/userOld.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.black]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                NewNome(),
                NewEmail(),
                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
