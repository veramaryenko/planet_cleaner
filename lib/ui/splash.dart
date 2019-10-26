import 'dart:async';
import 'package:flutter/material.dart';
import 'package:planet_cleaner/ui/info.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  void handleTimeout() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
            builder: (BuildContext context) => new InfoScreen()));
  }

  startTimeout() async {

    var duration = const Duration(seconds: 4);
    return new Timer(duration, handleTimeout);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Icon(
                          Icons.public,
                          color: Colors.green,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Planet Cleaner",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),),
                    Text("       Make Planet\nClean and Beautiful", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              )
            ],
          )
        ],
      ) ,

    );
  }
}
