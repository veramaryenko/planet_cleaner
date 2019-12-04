import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_cleaner/ui/camera/gallery_and_camera.dart';
import 'package:planet_cleaner/ui/types_of_poll_swiper.dart';

class ActionPage extends StatefulWidget {
  ActionPage({Key key}) : super(key: key);

  @override
  ActionPageState createState() => ActionPageState();
}

class ActionPageState extends State<ActionPage> {
  int selectedIndex = 1;

  final widgetOptions = [
    new TypesOfPollution(),
    new CameraTestWidget(),
    Text('Latest Posts'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Cleaner',
            style: Theme.of(context).primaryTextTheme.display3),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink, color: Colors.lightBlueAccent),
              title: Text(
                'Types of Pollutans',
              ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo, color: Colors.lightBlueAccent),
              title: Text('Send a request')),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle,
                  color: Colors.lightBlueAccent),
              title: Text('Latest Posts')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.black,
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
