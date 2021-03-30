import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/net/firebase.dart';
import 'package:bizzhome/utils/authentication.dart';

class Auth {
  static User returnUserDetails() {
    final user = getUserID();
    print(user);
    return User(
      displayName: "Muhammad Jazzel Mehmood",
      company: "Samsung",
      avatar: "assets/images/user.jpg",
      bio: "This is bio",
      skills_background: "Bht saray hein ! ",
      educational_background: "ksi kam ka nei !",
      date_of_birth: "2020-01-01",
      registered_date: "2020-01-01",
    );
  }

  static getUserDetails() async {
    final user = await getUserName();
    return user;
  }

  static User authorizeUser(String email, String password) {
    if (email == "admin" && password == "admin") {
      return User(
        displayName: "Muhammad Jazzel Mehmood",
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

  static registerUser(String email, String password, String type) async {
    bool flag = false;
    await registerWithEmailPassword(email, password).then((result) {
      if (result != null) {
        flag = true;
      }
      userSetup(type);
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

  static updateUserProfile(User user) {
    updateProfile(
        user.displayName,
        user.avatar,
        user.bio,
        user.skills_background,
        user.educational_background,
        user.registered_date,
        user.date_of_birth);
  }
}
