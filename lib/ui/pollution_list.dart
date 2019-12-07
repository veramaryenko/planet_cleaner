import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class PollutionListPage extends StatefulWidget {
  PollutionListPage({Key key}) : super(key: key);

  @override
  PollutionListPageState createState() => PollutionListPageState();
}

class PollutionListPageState extends State<PollutionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
                future:
                DefaultAssetBundle.of(context).loadString('assets/pollutions.json'),
                builder: (context, snapshot) {
                  var pollutions = json.decode(snapshot.data.toString());

                  return new ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var pollution = pollutions[index];
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name: " + pollution['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                            new Text("Country: " + pollution['country'],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 20)),
                            new Text("ABV: " + pollution['abv'],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 20)),
                            new Image.network(pollution['image'], height: 200)
                          ],
                        ),
                      );
                    },
                    itemCount: pollutions == null ? 0 : pollutions.length,
                  );
                }),
          ),
        ));
  }
}