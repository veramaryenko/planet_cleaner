import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:planet_cleaner/services/location_service.dart';
import 'package:planet_cleaner/ui/action.dart';
import 'package:planet_cleaner/utils/app_color.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void navigateToActionPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => ActionPage()));
  }

  @override
  Widget build(BuildContext context) {

    var firstColor = Colors.lightBlueAccent, secondColor = Colors.lightGreen;

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
                'This app was created for showing the people how big is the problem od pollution nowadays.',
                style: Theme.of(context).primaryTextTheme.display4,
                textAlign: TextAlign.center,
              ),
              Text(
                'Are you ready to help?',
                style: Theme.of(context).primaryTextTheme.display3,
                textAlign: TextAlign.center,
              ),
              NiceButton(
                radius: 30,
                padding: const EdgeInsets.all(15),
                text: "Yes!",
                background: AppColor.white,
                gradientColors: [firstColor, secondColor],
                onPressed: (){
                  navigateToActionPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
