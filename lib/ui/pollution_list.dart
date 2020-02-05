import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class PollutionListPage extends StatefulWidget {
  const PollutionListPage({Key key}) : super(key: key);

  @override
  PollutionListPageState createState() => PollutionListPageState();
}

class PollutionListPageState extends State<PollutionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/pollutions.json'),
              builder: (context, snapshot) {
                var pollutions = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final pollution = pollutions[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Name: ' + pollution['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Country: ' + pollution['country'],
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'ABV: ' + pollution['abv'],
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          Image.network(pollution['image'], height: 200)
                        ],
                      ),
                    );
                  },
                  itemCount: pollutions == null ? 0 : pollutions.length,
                );
              }),
        ),
      ),
    );
  }
}
