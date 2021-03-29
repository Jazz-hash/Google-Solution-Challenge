import 'package:bizzhome/screens/company_profile.dart';
import 'package:bizzhome/screens/edit_profile.dart';
import 'package:bizzhome/screens/reviews.dart';
import 'package:bizzhome/screens/login.dart';
import 'package:bizzhome/screens/notifications.dart';
import 'package:bizzhome/screens/profile.dart';
import 'package:bizzhome/screens/register.dart';
import 'package:bizzhome/screens/task_details.dart';
import 'package:bizzhome/styles.dart';
import 'package:bizzhome/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const LoginRoute = "/";
const DashboardRoute = "/dashboard";
const RegisterRoute = "/register";
const ItemsRoute = "/items";
const TaskDetailRoute = "/task_detail";
const ProfileRoute = "/profile";
const ProfileEditRoute = "/edit_profile";
const NotificationRoute = "/notifications";
const CompanyRoute = "/company";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.black),
      themeMode: ThemeMode.light,
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LoginRoute:
          screen = LoginPage();
          break;
        case DashboardRoute:
          screen = DashboardPage();
          break;
        case RegisterRoute:
          screen = RegisterPage();
          break;
        case ItemsRoute:
          screen = ReviewsPage();
          break;
        case TaskDetailRoute:
          screen = TaskDetailPage(arguments["id"], arguments["myTask"]);
          break;
        case ProfileRoute:
          screen = ProfilePage();
          break;
        case ProfileEditRoute:
          screen = EditProfilePage();
          break;
        case NotificationRoute:
          screen = NotificationsPage();
          break;
        case CompanyRoute:
          screen = CompanyPage();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        backgroundColor: Colors.black87,
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
