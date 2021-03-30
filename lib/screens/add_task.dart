import 'package:bizzhome/models/Auth.dart';
import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/net/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String name = "";
  String company = "";
  final user = Auth.returnUserDetails();
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController clientController = new TextEditingController();
  TextEditingController durationController = new TextEditingController();
  TextEditingController pointsController = new TextEditingController();
  TextEditingController imageController = new TextEditingController();

  _getdetails() async {
    final user2 = await Auth.getUserDetails();
    print("user2");
    setState(() {
      name = user2["username"];
      company = user2["company"];
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getdetails());
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = user.displayName;
    descriptionController.text = user.bio;
    clientController.text = user.skills_background;
    durationController.text = user.educational_background;
    pointsController.text = user.date_of_birth;
    imageController.text = user.date_of_birth;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        user.avatar,
                      ),
                    ),
                    maxRadius: 50,
                  ),
                  Text(""),
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    company,
                    style: TextStyle(
                      height: 2,
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.subtitles, color: Colors.black),
                        hintText: 'Title',
                        labelText: 'Title',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: clientController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person, color: Colors.black),
                        hintText: 'Client Name',
                        labelText: 'Client Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: durationController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.timelapse, color: Colors.black),
                        hintText: 'Duration ',
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Duration',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: pointsController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.score, color: Colors.black),
                        hintText: 'Points ',
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Points',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.book, color: Colors.black),
                        hintText: 'Description ',
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Description',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Color(0xFFEB5757),
                        splashColor: Colors.white.withOpacity(0.5),
                        onPressed: () => {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit),
                                Text(" Add Task"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
