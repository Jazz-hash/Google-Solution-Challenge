import 'package:bizzhome/app.dart';
import 'package:flutter/material.dart';

import 'package:bizzhome/widgets/button.dart';
import 'package:bizzhome/widgets/first.dart';
import 'package:bizzhome/widgets/inputEmail.dart';
import 'package:bizzhome/widgets/password.dart';
import 'package:bizzhome/widgets/textLogin.dart';
import 'package:bizzhome/widgets/verticalText.dart';

class Login extends StatelessWidget {
  _onLocationTap(BuildContext context) {
    Navigator.of(context).pushNamed(DashboardRoute);
  }

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
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
