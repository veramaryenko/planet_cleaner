import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActionPage extends StatefulWidget {
  ActionPage({Key key}) : super(key: key);

  @override
  ActionPageState createState() => ActionPageState();
}

class ActionPageState extends State<ActionPage> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Pollution List'),
    Text('Add new pollution'),
    Text('Favourites'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Cleaner'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), title: Text('Types of Pollution')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('Send a request')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}