import 'dart:async';
import 'package:flutter/material.dart';
import 'package:planet_cleaner/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainPageAfterSeconds(sec: 3);
  }

  void navigateToMainPage() {
    Navigator.pushReplacementNamed(context, 'WelcomeUserSceen');
  }

  Future<Timer> _navigateToMainPageAfterSeconds({int sec}) async {
    return Timer(Duration(seconds: sec), navigateToMainPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Icon(
                  Icons.public,
                  color: AppColor.lightGreen,
                  size: 70.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 108.0, top: 20),
                child: Text('Planet Cleaner',
                    style: Theme.of(context).primaryTextTheme.display3),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child:
                    CircularProgressIndicator(backgroundColor: AppColor.yellow),
              ),
              Text(
                'Make Planet Clean and Beautiful',
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.display3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
