import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String type) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();

  users.doc(uid).set({"type": type, "uid": uid});
  return;
}

Future<void> updateProfile(
  String displayName,
  String avatar,
  String bio,
  String skills_background,
  String educational_background,
  String registered_date,
  String date_of_birth,
) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.doc(uid).update({
    "displayName": displayName,
    "avatar": avatar,
    "bio": bio,
    "skills_background": skills_background,
    "educational_background": educational_background,
    "registered_date": registered_date,
    "date_of_birth": date_of_birth,
  });
  return;
}

String getUserID() {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  return uid;
}

Future<DocumentSnapshot> getUserName() async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String name = auth.currentUser.displayName.toString();
  String uid = auth.currentUser.uid.toString();
  DocumentSnapshot data = await users.doc(uid).get();
  return data;
}
// bool isUserLoggedIn() {
//   FirebaseAuth auth = FirebaseAuth.instance;
//     var user =  auth.currentUser.uid.toString();
//     return user != null;
//   }
