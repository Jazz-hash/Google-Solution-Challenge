import 'package:bizzhome/models/Auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final user = Auth.getUserDetails();
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController skillsController = new TextEditingController();
  TextEditingController eduController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = user.displayName;
    bioController.text = user.bio;
    skillsController.text = user.skills_background;
    eduController.text = user.educational_background;
    dobController.text = user.date_of_birth;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
                      controller: nameController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText:
                            'Name ( It will be displayed to other users )',
                        labelText: 'Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: bioController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Bio',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextField(
                      controller: skillsController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.work, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Skills background',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextField(
                      controller: eduController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(
                        icon: Icon(Icons.book, color: Colors.white),
                        labelText: 'Educational background',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.white),
                        hintText: 'Date of birth ',
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Date of birth',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 150.0, top: 30.0),
                        child: new RaisedButton(
                          child: const Text('Submit'),
                          onPressed: null,
                        )),
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
