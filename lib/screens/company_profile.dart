import 'package:bizzhome/app.dart';
import 'package:bizzhome/models/Auth.dart';
import 'package:bizzhome/models/Review.dart';
import 'package:bizzhome/models/Task.dart';
import 'package:bizzhome/widgets/FeedTileOverlay.dart';
import 'package:bizzhome/widgets/imageBanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final user = Auth.returnUserDetails();

  String name = "";
  String company = "";

  _getdetails() async {
    final user2 = await Auth.getUserDetails();
    print("user2");
    setState(() {
      name = user2["username"];
      company = user2["company"];
    });
  }

  final tasks = Task.fetchCompanyTasks("Oaks");

  _onTaskTap(BuildContext context, int taskID) {
    Navigator.pushNamed(context, TaskDetailRoute,
        arguments: {"id": taskID, "myTask": true});
  }

  _onTaskTypeTap(BuildContext context, String type) {
    final tasks = Task.fetchInProgress(type);
    for (var i = 0; i < tasks.length; i++) {
      debugPrint(tasks[i].title);
    }
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
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
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
                                    Text(company,
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
                    onTap: () => Navigator.of(context).pushNamed(ProfileRoute),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Active Tasks",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            FlatButton(
                              textColor: Colors.white,
                              color: Color(0xFFEB5757),
                              splashColor: Colors.white.withOpacity(0.5),
                              onPressed: () =>
                                  Navigator.of(context).pushNamed(AddTaskRoute),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text(" Add Task"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ])),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) =>
                      _itemBuilder(context, tasks[index]),
                ),
              ),
            ),
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

  Widget _itemBuilder(BuildContext context, task) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => _onTaskTap(context, task.id),
        key: Key('task_list_item_${task.id}'),
        child: Container(
          height: 100.0,
          child: Stack(
            children: [
              ImageBanner(assetPath: task.imagePath),
              FeedTileOverlay(
                task.title,
                task.client.name,
                task.client.company,
                task.assignedDate,
                task.description,
                task.duration,
                task.points,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
