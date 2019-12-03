import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_cleaner/ui/camera/camera.dart';
import 'package:planet_cleaner/ui/pollution_list.dart';
import 'package:planet_cleaner/ui/types_of_poll_swiper.dart';

class ActionPage extends StatefulWidget {
  ActionPage({Key key}) : super(key: key);

  @override
  ActionPageState createState() => ActionPageState();
}

class ActionPageState extends State<ActionPage> {
  int selectedIndex = 0;
  final widgetOptions = [
    new TypesOfPollution(),
    new CameraWidget(),
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
              icon: Icon(Icons.favorite), title: Text('Latest Posts')),
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
