import 'package:flutter/material.dart';
import 'package:planet_cleaner/utils/app_color.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Hi!', style: Theme.of(context).primaryTextTheme.display1),
            Text(
              'Nice to see you in our Planet Cleaner Army!\nTo clean our Planet I need you to\naccept some agreements.',
              style: Theme.of(context).primaryTextTheme.display2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}