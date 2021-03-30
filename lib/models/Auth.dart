import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/net/firebase.dart';
import 'package:bizzhome/utils/authentication.dart';

class Auth {
  static User returnUserDetails() {
    final user = getUserID();
    print(user);
    return User(
      displayName: "Mustafa Khan",
      company: "Samsung",
      avatar: "assets/images/user.jpg",
      bio:
          "Hello, I'm Mustafa, a passionate individual who loves playing cricket and someone who always takes their work seriously. Residing in Karachi, I am always looking for opportunities where I can put my skills to test and also make a living out of them.",
      skills_background:
          "Driving (Light transport vehicle) , Cooking (Pakistani Cuisine) , Painting",
      educational_background:
          "Completed Matriculation from Karachi Montessori & High School - 2013 ,  Completed Intermediate from Karachi Montessori & High School - 2015",
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
        displayName: "Mustafa Khan",
        company: "Samsung",
        avatar: "assets/images/user.jpg",
        bio:
            "Hello, I'm Mustafa, a passionate individual who loves playing cricket and someone who always takes their work seriously. Residing in Karachi, I am always looking for opportunities where I can put my skills to test and also make a living out of them.",
        skills_background:
            "Driving (Light transport vehicle) , Cooking (Pakistani Cuisine) , Painting",
        educational_background:
            "Completed Matriculation from Karachi Montessori & High School - 2013 ,  Completed Intermediate from Karachi Montessori & High School - 2015",
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
