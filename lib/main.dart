import 'package:bizzhome/screens/login.dart';
import 'package:bizzhome/widgets/navigator.dart';
import 'package:flutter/material.dart';

const HomeRoute = "/";
const LoginRoute = "/login";
const RegisterRoute = "/register";

void main() => runApp(App());

class App extends StatelessWidget {
  var loginUser = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: loginUser != null ? Dashboard() : Login(),
      ),
    );
  }
}
