import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => new _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Hello!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Icon(
                          Icons.public,
                          color: Colors.green,
                          size: 70.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Nice to see you in \nPlanet Clear Army!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'To help Planet we ask you\nto accept some agreements',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                    ),
                    FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(12.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
