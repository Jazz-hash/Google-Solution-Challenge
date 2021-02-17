import 'package:bizzhome/models/User.dart';

class Auth {
  static List<User> getUserDetails() {
    return [
      User(
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
      ),
    ];
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
}
