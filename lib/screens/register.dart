import 'package:bizzhome/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/widgets/signup.dart';
import 'package:bizzhome/widgets/textNew.dart';
import 'package:bizzhome/widgets/userOld.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value, Color color) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: color,
        content: Text(value, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  String _validateEmail(String value) {
    value = value.trim();

    if (emailController.text != null) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String _validatePassword(String value) {
    value = value.trim();

    if (passwordController.text != null) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  _onRegisterTap(BuildContext context) {
    if (_validateEmail(emailController.text) == null &&
        _validatePassword(passwordController.text) == null) {
      final _registerUser =
          Auth.registerUser(emailController.text, passwordController.text);
      print(_registerUser);
      // if (registerUser) {
      showInSnackBar("Success !! Now you can login.", Colors.green);
      // } else {
      // showInSnackBar("Oops !! Something went wrong.", Colors.red);
      // }
    } else {
      showInSnackBar(
          "Error !! Please enter valid email & password.", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF434343), Color(0xFF000000)]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SignUp(),
                    TextNew(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[700],
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      onPressed: () => _onRegisterTap(context),
                      child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'GO',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
