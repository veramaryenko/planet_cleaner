import 'package:flutter/material.dart';
import 'package:planet_cleaner/ui/welcome_page.dart';
import 'package:planet_cleaner/ui/splash_page.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:planet_cleaner/ui/action.dart';

void main() {
  runApp(PlanetCleanerApp());
}

class PlanetCleanerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: AppColor.lightBlue,
          primaryColor: Colors.blue,
          accentColor: Colors.lightBlueAccent,
          primaryTextTheme: TextTheme(
            display1: TextStyle(
              color: AppColor.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            display2: TextStyle(
              color: AppColor.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            display3: TextStyle(
              color: AppColor.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            display4: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          'WelcomeUserSceen': (BuildContext context) => WelcomePage(),
          'CameraScreen': (BuildContext context) => ActionPage(),
        });
  }
}
