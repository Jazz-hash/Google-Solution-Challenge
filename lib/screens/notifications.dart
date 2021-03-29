import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              // leading: FlutterLogo(size: 56.0),
              title: Text('Welcome to Bizz Home! Wonderful!', style: TextStyle(color: Colors.red, fontSize: 25.0),),
              subtitle: Text('We hope to contribute to your business and help each other in testing times!'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              // leading: FlutterLogo(size: 72.0),
              title: Text('Check!',style: TextStyle(color: Colors.red, fontSize: 25.0),),
              subtitle: Text(
                  'Check your score daily for new reviews and revenue generated'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      )

      // new Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //
      // // child: new Column(
      // // children : [
      // //   new Padding(padding: EdgeInsets.all(20.0)),
      //   Padding(
      //     padding: EdgeInsets.all(50.0),
      //     child: new Text('Welcome to Bizz Home! We hope to contribute to your business and help each other in testing times! Wonderful! Check your score daily for new reveiws and revenue generated',
      //   style: new TextStyle(color: Colors.red, fontSize: 25.0),),),
      //     // new Text('Wonderful! Check your score daily for new reveiws and revenue generated'
      //       // child: new TextField(
      //       //     decoration: InputDecoration(
      //       //         contentPadding: EdgeInsets.all(10)
      //       //     )
      //       // ),
      //
      //     // SizedBox(width: 20.0,),
      //
      //     // Padding(new Text('Welcome to Bizz Home! We hope to contribute to your business and help each other in testing times! Wonderful! Check your score daily for new reveiws and revenue generated')
      //     // ),// SizedBox(width: 20.0,),
      //     // new Flexible(
      //     //   child: new TextField(
      //     //       decoration: InputDecoration(
      //     //           contentPadding: EdgeInsets.all(10)
      //     //       )
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
