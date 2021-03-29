import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        color: Colors.black,
        child: ListTile(
        onTap: () {
        //open edit profile
        },
        title: Text(
        "John Doe",
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        ),
        ),
        // leading: CircleAvatar(
        // // backgroundImage: NetworkImage(avatars[0]),
        // ),
        trailing: Icon(
        Icons.edit,
        color: Colors.white,
        ),
        ),
        ),
          Card(
            elevation: 4.0,
            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //open change password
                  },
                ),
                // _buildDivider(),

                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.language,
                    color: Colors.black,
                  ),
                  title: Text("Change Language"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //open change language
                  },
                ),
                // _buildDivider(),
                // ListTile(
                //   leading: Icon(
                //     Icons.location_on,
                //     color: Colors.purple,
                //   ),
                //   title: Text("Change Location"),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     //open change location
                //   },
                // ),
              ],
            ),
          ),
    ],),),);
  }
}
