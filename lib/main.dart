import 'package:flutter/material.dart';
import 'package:planet_cleaner/ui/info.dart';
import 'package:planet_cleaner/ui/splash.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent),
      debugShowCheckedModeBanner: false,
    home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'InfoScreen': (BuildContext context) => InfoScreen()
      },
));

