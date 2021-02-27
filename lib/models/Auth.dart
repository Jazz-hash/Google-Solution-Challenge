import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/utils/authentication.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  static User getUserDetails() {
    return User(
      id: 1,
      username: "Jazz-hash",
      fullname: "Muhammad Jazzel Mehmood",
      password: "passwordishard",
      avatar: "assets/images/user.jpg",
      bio: "This is bio",
      skills_background: "Bht saray hein ! ",
      educational_background: "ksi kam ka nei !",
      date_of_birth: "2020-01-01",
      registered_date: "2020-01-01",
    );
  }

  static User authorizeUser(String email, String password) {
    if (email == "admin" && password == "admin") {
      return User(
        id: 1,
        username: "Jazz-hash",
        fullname: "Muhammad Jazzel Mehmood",
        password: "passwordishard",
        avatar: "assets/images/user.jpg",
        bio: "This is bio",
        skills_background: "Bht saray hein ! ",
        educational_background: "ksi kam ka nei !",
        date_of_birth: "2020-01-01",
        registered_date: "2020-01-01",
      );
    } else {
      return null;
    }
  }

  static registerUser(String email, String password) async {
    await registerWithEmailPassword(email, password).then((result) {
      if (result != null) {
        return true;
      }
    }).catchError((error) {
      print('Registration Error: $error');
      return false;
    });
  }

  static signInUser(String email, String password) async {
    await signInWithEmailPassword(email, password).then((result) {
      if (result != null) {
        return true;
      } else {
        return false;
      }
    }).catchError((error) {
      print('Login Error: $error');
      return false;
    });
  }
}
