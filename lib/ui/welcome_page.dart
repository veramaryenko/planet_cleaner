import 'package:flutter/material.dart';
import 'package:planet_cleaner/ui/action.dart';
import 'package:planet_cleaner/ui/widgets/button_planet.dart';
import 'package:planet_cleaner/utils/app_color.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Text(
                'Nice to see you in our\nPlanet Cleaner Army!',
                style: Theme.of(context).primaryTextTheme.display3,
                textAlign: TextAlign.center,
              ),
              Text(
                'This app was created to show people how big is the problem of pollution nowadays.',
                style: Theme.of(context).primaryTextTheme.display4,
                textAlign: TextAlign.center,
              ),
              Text(
                'Are you ready to help?',
                style: Theme.of(context).primaryTextTheme.display3,
                textAlign: TextAlign.center,
              ),
              ButtonPlanet(
                'Yes',
                () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ActionPage(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
