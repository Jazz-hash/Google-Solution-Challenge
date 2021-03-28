import 'package:bezier_chart/bezier_chart.dart';
import 'package:bizzhome/app.dart';
import 'package:bizzhome/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class ProfilePage extends StatelessWidget {
  final user = Auth.returnUserDetails();

  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  final _folding2CellKey = GlobalKey<SimpleFoldingCellState>();
  final _folding3CellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.black87,
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
                      user.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Monthly Progress",
                    style: TextStyle(
                      height: 2,
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
              color: Color(0xFF2e282a),
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                series: const [
                  BezierLine(
                    data: const [
                      DataPoint<double>(value: 10, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 50, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 0, xAxis: 25),
                      DataPoint<double>(value: 5, xAxis: 30),
                      DataPoint<double>(value: 45, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.white,
                  showVerticalIndicator: true,
                  backgroundColor: Color(0xFF000000),
                  snap: false,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SimpleFoldingCell(
                key: _foldingCellKey,
                frontWidget: _buildBasicInfoWidget(),
                innerTopWidget: _buildBasicInfoTopWidget(),
                innerBottomWidget: _buildBasicInfoBottomWidget(),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SimpleFoldingCell(
                key: _folding2CellKey,
                frontWidget: _buildEducationWidget(),
                innerTopWidget: _buildEducationTopWidget(),
                innerBottomWidget: _buildEducationBottomWidget(),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SimpleFoldingCell(
                key: _folding3CellKey,
                frontWidget: _buildSkillsWidget(),
                innerTopWidget: _buildSkillsTopWidget(),
                innerBottomWidget: _buildSkillsBottomWidget(),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: FlatButton(
                textColor: Colors.white,
                color: Color(0xFFE5634D),
                splashColor: Colors.white.withOpacity(0.5),
                onPressed: () =>
                    Navigator.of(context).pushNamed(ProfileEditRoute),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        Text(" Edit profile"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoWidget() {
    return Container(
        color: Color(0xFFE5634D),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Basic Information",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
            Text(""),
            FlatButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_downward),
                ],
              ),
              textColor: Colors.white,
              color: Color(0xFFE5634D),
              minWidth: 30,
              splashColor: Colors.white.withOpacity(0.5),
            ),
          ],
        ));
  }

  Widget _buildEducationWidget() {
    return Container(
        color: Color(0xFFE5634D),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Education",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                )),
            Text(""),
            FlatButton(
              onPressed: () => _folding2CellKey?.currentState?.toggleFold(),
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_downward),
                ],
              ),
              textColor: Colors.white,
              color: Color(0xFFE5634D),
              minWidth: 30,
              splashColor: Colors.white.withOpacity(0.5),
            ),
          ],
        ));
  }

  Widget _buildSkillsWidget() {
    return Container(
        color: Color(0xFFE5634D),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Skills",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
            Text(""),
            FlatButton(
              onPressed: () => _folding3CellKey?.currentState?.toggleFold(),
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_downward),
                ],
              ),
              textColor: Colors.white,
              color: Color(0xFFE5634D),
              minWidth: 30,
              splashColor: Colors.white.withOpacity(0.5),
            ),
          ],
        ));
  }

  Widget _buildBasicInfoTopWidget() {
    return Container(
      height: 50,
      color: Color(0xFFE5634D),
      alignment: Alignment.center,
      child: Text(
        "Basic Information",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _buildBasicInfoBottomWidget() {
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Text(""),
            Text(
              "@" + user.displayName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              user.bio,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: FlatButton(
                onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_upward),
                  ],
                ),
                textColor: Colors.black,
                color: Colors.transparent,
                minWidth: 30,
                splashColor: Colors.white.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEducationTopWidget() {
    return Container(
      color: Color(0xFFE5634D),
      alignment: Alignment.center,
      child: Text(
        "Education",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _buildEducationBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(""),
            Text(
              user.educational_background,
              style: TextStyle(color: Colors.black, fontSize: 16, height: 2),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: FlatButton(
                onPressed: () => _folding2CellKey?.currentState?.toggleFold(),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_upward),
                  ],
                ),
                textColor: Colors.black,
                color: Colors.transparent,
                minWidth: 30,
                splashColor: Colors.white.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsTopWidget() {
    return Container(
      color: Color(0xFFE5634D),
      alignment: Alignment.center,
      child: Text(
        "Skills",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _buildSkillsBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(""),
            Text(
              user.skills_background,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: FlatButton(
                onPressed: () => _folding3CellKey?.currentState?.toggleFold(),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_upward),
                  ],
                ),
                textColor: Colors.black,
                color: Colors.transparent,
                minWidth: 30,
                splashColor: Colors.white.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
