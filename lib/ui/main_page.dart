import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_cleaner/ui/create_image_page.dart';
import 'package:planet_cleaner/ui/maps.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:planet_cleaner/ui/types_of_poll_swiper.dart';

@immutable
class MainPageView extends StatefulWidget {
  const MainPageView({Key key}) : super(key: key);

  @override
  MainPageViewState createState() => MainPageViewState();
}

class MainPageViewState extends State<MainPageView> {
  int selectedIndex = 1;
  final List<Widget> widgetOptions = [
    const TypesOfPollution(),
    CreateImageView(),
    MyApp(),
   // const Text('Latest Posts'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Cleaner',
            style: Theme.of(context).primaryTextTheme.display1),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: AppColor.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink, color: AppColor.lightGreen),
            title: const Text('Types of pollutants'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo, color: AppColor.lightGreen),
            title: const Text('Send request'),
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.supervised_user_circle, color: AppColor.lightGreen),
            title: const Text('Maps'),
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.black,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
