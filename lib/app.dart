import 'package:bizzhome/screens/items.dart';
import 'package:bizzhome/screens/login.dart';
import 'package:bizzhome/screens/register.dart';
import 'package:bizzhome/styles.dart';
import 'package:bizzhome/widgets/navigator.dart';
import 'package:flutter/material.dart';

const LoginRoute = "/";
const DashboardRoute = "/dashboard";
const RegisterRoute = "/register";
const ItemsRoute = "/items";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LoginRoute:
          screen = Login();
          break;
        case DashboardRoute:
          screen = Dashboard();
          break;
        case RegisterRoute:
          screen = Register();
          break;
        case ItemsRoute:
          screen = ItemsPage();
          break;
        // case RegisterRoute:
        //   screen = Register(arguments["id"]);
        //   break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: AppBarTextStyle,
          ),
        ),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TitleTextStyle,
          // ignore: deprecated_member_use
          subtitle: SubTitleTextStyle,
          // ignore: deprecated_member_use
          caption: CaptionTextStyle,
          // ignore: deprecated_member_use
          body1: Body1TextStyle,
        ));
  }
}
