import 'package:bizzhome/app.dart';
import 'package:bizzhome/models/Auth.dart';
import 'package:bizzhome/models/Review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final user = Auth.returnUserDetails();
  String name = "";

  _getdetails() async {
    final user2 = await Auth.getUserDetails();
    print("user2");
    setState(() {
      name = user2["username"];
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getdetails());
  }

  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    final reviewCount = Review.getCount();

    return Scaffold(
      appBar: AppBar(
        title: Text('BizzHome'),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationRoute);
              // do something
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.create_rounded,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Text("Edit profile",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            ),
                            Text(
                              "@" + name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(24.0),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset(
                                    user.avatar,
                                  ),
                                ),
                                maxRadius: 35,
                              ),
                            )))
                      ]),
                ),
                onTap: () => Navigator.of(context).pushNamed(ProfileRoute)),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Material(
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.assessment_outlined,
                                    color: Color(0xFFEB5757), size: 20.0),
                              )),
                          Padding(padding: EdgeInsets.only(right: 15)),
                          Text('Orders',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, bottom: 8.0)),
                              Icon(Icons.done, color: Colors.white),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text('294',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, bottom: 8.0)),
                              Icon(Icons.construction, color: Colors.white),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text('8',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Material(
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.star_rate_sharp,
                                    color: Color(0xFFEB5757), size: 20.0),
                              )),
                          Padding(padding: EdgeInsets.only(right: 15)),
                          Text('Reviews',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, bottom: 8.0)),
                              Icon(Icons.more_time, color: Colors.white),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(reviewCount.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, bottom: 8.0)),
                              Icon(Icons.history, color: Colors.white),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text('8',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              // onTap: () =>
              //     Navigator.of(context).pushNamed(NotificationRoute)
            ),
            _buildTile(
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Revenue',
                                  style: TextStyle(color: Colors.white)),
                              Text('\$16K',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34.0)),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                      Sparkline(
                        data: charts[actualChart],
                        lineWidth: 5.0,
                        lineColor: Colors.white,
                      )
                    ],
                  )),
              onTap: () => Navigator.of(context).pushNamed(CompanyRoute),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Reviews',
                              style: TextStyle(color: Colors.white)),
                          Text(reviewCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0)),
                        ],
                      ),
                      Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.store,
                                color: Color(0xFFEB5757), size: 30.0),
                          )))
                    ]),
              ),
              onTap: () => Navigator.of(context).pushNamed(ItemsRoute),
            )
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 160.0),
            StaggeredTile.extent(1, 160.0),
            StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 110.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0xFFFFFFF),
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
        onTap: onTap != null
            ? () => onTap()
            : () {
                print('Not set yet');
              },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, -2.0),
                  end: Alignment(1.0, 2.0),
                  colors: [Color(0xFFEB5757), Color(0xFF000000)]),
              borderRadius: new BorderRadius.all(
                const Radius.circular(10.0),
              )),
          child: child,
        ),
      ),
    );
  }
}
