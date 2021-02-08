import 'package:bizzhome/screens/home.dart';
import 'package:bizzhome/screens/newsfeed.dart';
import 'package:bizzhome/screens/notifications.dart';
import 'package:bizzhome/screens/profile.dart';
import 'package:bizzhome/screens/tasksheet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> _children = [
    Home(),
    Profile(),
    Notifications(),
    NewsFeed(),
    TaskSheet(),
  ];

  int _currentIndex = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.black87,
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark,
    // ));

    return Scaffold(
      appBar: AppBar(
        title: Text('BizzHome'),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        color: Colors.black87,
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: Colors.black87,
          buttonBackgroundColor: Colors.white,
          height: 50,
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(milliseconds: 200),
          index: 0,
          items: [
            Icon(Icons.home, size: 20, color: Colors.grey),
            Icon(Icons.verified_user, size: 20, color: Colors.grey),
            Icon(Icons.add, size: 20, color: Colors.grey),
            Icon(Icons.favorite, size: 20, color: Colors.grey),
            Icon(Icons.list, size: 20, color: Colors.grey),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
