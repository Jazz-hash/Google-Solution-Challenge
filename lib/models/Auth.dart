import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/net/firebase.dart';
import 'package:bizzhome/utils/authentication.dart';

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
    bool flag = false;
    await registerWithEmailPassword(email, password).then((result) {
      if (result != null) {
        flag = true;
      }
      userSetup(email);
    }).catchError((error) {
      print('Registration Error: $error');
      flag = false;
    });
    return flag;
  }

  static signInUser(String email, String password) async {
    bool flag = false;
    await signInWithEmailPassword(email, password).then((result) {
      print(result);
      if (result != null) {
        flag = true;
      }
    }).catchError((error) {
      print('Login Error: $error');
      flag = false;
    });
    return flag;
  }
}
